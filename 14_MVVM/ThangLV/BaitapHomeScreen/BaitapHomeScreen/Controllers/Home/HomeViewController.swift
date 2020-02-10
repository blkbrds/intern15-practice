//
//  HomeViewController.swift
//  BaitapHomeScreen
//
//  Created by PCI0008 on 2/4/20.
//  Copyright © 2020 PCI0008. All rights reserved.
//

import UIKit

// MARK: Enum
enum Status {
    case table
    case collection
    var itemSize: CGSize {
        switch self {
        case .table:
            return CGSize(width: UIScreen.main.bounds.width - 20, height: 110)
        case .collection:
            return CGSize(width: UIScreen.main.bounds.width / 2 - 10, height: UIScreen.main.bounds.width / 2 - 10)
        }
    }
    var sectionInset: UIEdgeInsets {
        switch self {
        case .table:
            return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        case .collection:
            return UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        }
    }
}

final class HomeViewController: UIViewController {

    //MARK: IBOutlet
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var prevButton: UIButton!
    @IBOutlet private weak var nextButton: UIButton!
    @IBOutlet private weak var pageControl: UIPageControl!

    //MARK: Properties
    private var index: Int = 0
    private var numberOfItems = 10
    private var viewModel = HomeViewModel()
    private var status = Status.table
    let cellNameOfTableType = "CustomCell"
    let cellNameOfCollectionType = "CollectionViewCell"
    
    // MARK: Override functions
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "HOME"
        setupScrollView()
        configCollectionView()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "collectionview"), style: .plain, target: self, action: #selector(viewTypeButtonTouchUpInside))
        changeFlowLayout(status: .collection)
    }

    @objc private func viewTypeButtonTouchUpInside() {
        configNavigationBar()
        if status == .collection {
            changeFlowLayout(status: .table)
        } else {
            changeFlowLayout(status: .collection)
        }
    }

    //MARK: Private functions
    private func setupScrollView() {
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(viewModel.images.count), height: 0.2 * view.frame.width)
        for i in 0..<viewModel.images.count {
            createImage(index: i)
        }
        setupPageControl()
    }

    private func setupPageControl() {
        pageControl.numberOfPages = viewModel.images.count
    }

    private func createImage(index: Int) {
        let imageView: UIImageView = UIImageView(image: UIImage(named: viewModel.images[index]))
        let originPoint = CGPoint(x: scrollView.contentSize.width * CGFloat(index) / CGFloat(viewModel.images.count), y: 0)
        imageView.frame = CGRect(origin: originPoint, size: CGSize(width: view.frame.width, height: view.frame.height / 5))
        scrollView.addSubview(imageView)
    }

    private func configCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.sectionInset = status.sectionInset
        collectionView.setCollectionViewLayout(flowLayout, animated: true)
        collectionView.register(UINib(nibName: cellNameOfTableType, bundle: nil), forCellWithReuseIdentifier: cellNameOfTableType)
        collectionView.register(UINib(nibName: cellNameOfCollectionType, bundle: nil), forCellWithReuseIdentifier: cellNameOfCollectionType)
        collectionView.isScrollEnabled = true
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    private func changeFlowLayout(status: Status) {
        self.status = status
        collectionView.reloadData()
    }

    private func configNavigationBar() {
        switch status {
        case .table:
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "collectionview"), style: .plain, target: self, action: #selector(viewTypeButtonTouchUpInside))
        case .collection:
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "tableview"), style: .plain, target: self, action: #selector(viewTypeButtonTouchUpInside))
        }
    }

    //MARK: IBAction
    @IBAction private func prevButtonTouchUpInside(_ sender: Any) {
        guard index > 0 else { return }
        index -= 1
        UIView.animate(withDuration: 0.5, animations: {
            self.scrollView.contentOffset = CGPoint(x: CGFloat(self.index) * self.view.frame.width, y: 0)
            self.nextButton.isEnabled = true
        }) { (done) in
            if self.index == 0 {
                self.prevButton.isEnabled = false
            }
        }
        pageControl.currentPage = index
    }

    @IBAction private func nextButtonTouchUpInside(_ sender: Any) {
        guard index < viewModel.images.count - 1 else { return }
        index += 1
        UIView.animate(withDuration: 0.5, animations: {
            self.scrollView.contentOffset = CGPoint(x: CGFloat(self.index) * self.view.frame.width, y: 0)
            self.prevButton.isEnabled = true
        }) { (done) in
            if self.index == self.viewModel.images.count - 1 {
                self.nextButton.isEnabled = false
            }
        }
        pageControl.currentPage = index
    }
}

//MARK: Extensions
extension HomeViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch status {
        case .collection:
            let cell: CustomCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellNameOfCollectionType, for: indexPath) as! CustomCell
            cell.viewModel = viewModel.viewModelForItems(at: indexPath)
            return cell
        case .table:
            let cell: CustomCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellNameOfTableType, for: indexPath) as! CustomCell
            cell.viewModel = viewModel.viewModelForItems(at: indexPath)
            return cell
        }
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        detailViewController.detailViewModel = DetailViewModel(images: viewModel.images)
        navigationController?.pushViewController(detailViewController, animated: true)
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.alpha = 0
        cell.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        UIView.animate(withDuration: 0.75) {
            cell.alpha = 1
            cell.transform = .identity
        }
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return status.itemSize
    }
}

