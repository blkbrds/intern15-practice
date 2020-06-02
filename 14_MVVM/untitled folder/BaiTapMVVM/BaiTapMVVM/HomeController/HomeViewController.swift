//
//  HomeViewController.swift
//  BaiTapMVVM
//
//  Created by PCI0012 on 6/2/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit

enum Status {
    case collectionView
    case tableView
}

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collection: UICollectionView!
    
    var viewModel = HomeViewModel()
    var status = Status.tableView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configHomeCell()
        viewModel.loadCafe()
        configNavigationBar()
        title = "Home"
    }
    
    private func configHomeCell() {
        let nib = UINib(nibName: "HomeTableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "HomeTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        
        let nib2 = UINib(nibName: "HomeCollectionViewCell", bundle: .main)
        collection.register(nib2, forCellWithReuseIdentifier: "HomeCollectionViewCell")
        collection.dataSource = self
        collection.delegate = self
    }
    
    
    private func configNavigationBar() {
        let collectionView = UIBarButtonItem(image: UIImage(systemName: "square.grid.2x2.fill"), style: .plain, target: self, action: #selector(selection))
        navigationItem.rightBarButtonItem = collectionView
        navigationController?.navigationBar.tintColor = .black
    }
    
    @objc func selection() {
        if status == .tableView {
            tableView.isHidden = true
            collection.isHidden = false
            let tableView = UIBarButtonItem(image: UIImage(systemName: "list.dash"), style: .plain, target: self, action: #selector(selection))
            navigationItem.rightBarButtonItem = tableView
            navigationController?.navigationBar.tintColor = .black
            status = .collectionView
        } else {
            collection.isHidden = true
            tableView.isHidden = false
            let collectionView = UIBarButtonItem(image: UIImage(systemName: "square.grid.2x2.fill"), style: .plain, target: self, action: #selector(selection))
            navigationItem.rightBarButtonItem = collectionView
            navigationController?.navigationBar.tintColor = .black
            status = .tableView
        }
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.viewModelNumberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        cell.homeCellViewModel = viewModel.viewModelCellForRowAt(indexPath: indexPath)
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.detailViewModel = DetailViewModel(cafe: viewModel.cafes[indexPath.row])
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.viewModelNumberOfRowsInSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        cell.homeCellViewModel = viewModel.viewModelCellForRowAt(indexPath: indexPath)
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.detailViewModel = DetailViewModel(cafe: viewModel.cafes[indexPath.row])
        navigationController?.pushViewController(vc, animated: true)
    }
}
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width - CGFloat(30)) / 2, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}
