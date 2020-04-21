//
//  HomeViewController.swift
//  BaiTapMVVM
//
//  Created by Sếp Quân on 4/8/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit

final class HomeViewController: BaseViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    // MARK: - Properties
    var viewModel = HomeViewModel()
    var index = 0
    var status: Status = .tableView
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Override
    override func setupData() {
        super.setupData()
        viewModel.getData()
    }
    
    override func setupUI() {
        super.setupUI()
        title = "Home"
        let nib = UINib(nibName: "HomeTableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "TableCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 100
        let nib2 = UINib(nibName: "HomeCell", bundle: .main)
        collectionView.register(nib2, forCellWithReuseIdentifier: "HomeCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        setupScrollView()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "collectionview"), style: .plain, target: self, action: #selector(collectionViewButton))
    }
    
    // MARK: - Function
    @objc private func tableViewButton() {
        self.status = .tableView
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "collectionview"), style: .plain, target: self, action: #selector(collectionViewButton))
        collectionView.isHidden = true
        tableView.isHidden = false
        tableView.alpha = 0
        UIView.animate(withDuration: 1, animations: {
            self.tableView.alpha = 1
        })
    }
    
    @objc private func collectionViewButton() {
        self.status = .collectionView
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "tableview"), style: .plain, target: self, action: #selector(tableViewButton))
        collectionView.isHidden = false
        tableView.isHidden = true
        collectionView.alpha = 0
        UIView.animate(withDuration: 1, animations: {
            self.collectionView.alpha = 1
        })
    }
    
    private func setupScrollView() {
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(viewModel.images.count), height: 300)
        for index in 0 ..< viewModel.images.count {
            let imageView = UIImageView(image: UIImage(named: viewModel.images[index]))
            imageView.frame = CGRect(x: view.frame.width * CGFloat(index), y: 0, width: view.frame.width, height: 300)
            scrollView.addSubview(imageView)
        }
    }
    
    // MARK: - IBAction
    @IBAction func turnLeftButtonTouchUpInside(_ sender: Any) {
        if index > 0 {
            index -= 1
            UIView.animate(withDuration: 1, animations: {
                self.scrollView.contentOffset = CGPoint(x: CGFloat(self.index) * self.view.frame.width, y: 0)
                self.pageControl.currentPage = self.index
            })
        }
    }
    
    @IBAction func turnRightButtonTouchUpInside(_ sender: Any) {
        if index < viewModel.images.count - 1 {
            index += 1
            UIView.animate(withDuration: 1, animations: {
                self.scrollView.contentOffset = CGPoint(x: CGFloat(self.index) * self.view.frame.width, y: 0)
                self.pageControl.currentPage = self.index
            })
        }
    }
}

// MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        viewModel.numberOfSections()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfRowInSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCollectionViewCell
            cell.viewModel = viewModel.viewModelForCell(at: indexPath)
            return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: UIScreen.main.bounds.width / 2 - 10, height: 200)
    }
}

// MARK: - UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        detailVC.titleDetail = viewModel.datas[indexPath.row].name
        detailVC.favorite = viewModel.datas[indexPath.row].favorite
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRowInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as! HomeTableViewCell
        cell.viewModel = viewModel.viewModelForCell(at: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        detailVC.titleDetail = viewModel.datas[indexPath.row].name
        detailVC.favorite = viewModel.datas[indexPath.row].favorite
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

