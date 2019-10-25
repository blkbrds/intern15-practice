//
//  HomeViewController.swift
//  abc
//
//  Created by PhuocNguyen on 10/22/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

final class HomeViewController: BaseViewController {
    
    @IBOutlet private weak var homeCollectionView: UICollectionView!
    
    var status: HomeShowStatus = .row
    var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print(viewModel.data.map {$0.isFavorite})
        print(status)
    }
    
    override func setupNavi() {
        title = "Home"
        turnOnRowMode()
    }
    
    override func setupUI() {
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
        homeCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        homeCollectionView.register(UINib(nibName: "HomeCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "HomeCell")
        homeCollectionView.register(UINib(nibName: "HomeGridCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "HomeGridCell")
         homeCollectionView.register(UINib(nibName: "HomeSlideCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "HomeSlideCell")
        
    }
    
    @objc private func turnOnGridMode() {
        status = .grid
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: status.image, style: .plain, target: self, action: #selector(turnOnRowMode))
        homeCollectionView.reloadData()
    }
    
    @objc private func turnOnRowMode() {
        status = .row
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: status.image, style: .plain, target: self, action: #selector(turnOnGridMode))
        homeCollectionView.reloadData()
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return viewModel.data.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeSlideCell", for: indexPath) as! HomeSlideCollectionViewCell
            cell.viewModel = HomeSlideCollectionCellViewModel(data: viewModel.slideImages)
            cell.configCollectionView()
            return cell
        }
        switch status {
        case .row:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCollectionViewCell
            cell.viewModel = HomeCollectionCellViewModel(data: viewModel.getItemAtIndexPath(indexPath))
            cell.setupUI()
            return cell
        case .grid:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeGridCell", for: indexPath) as! HomeGridCollectionViewCell
            cell.viewModel = HomeCollectionCellViewModel(data: viewModel.getItemAtIndexPath(indexPath))
            cell.setupUI()
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section != 0 {
            let detailVC = DetailViewController()
            detailVC.viewModel = DetailViewModel(data: viewModel.getItemAtIndexPath(indexPath))
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: collectionView.bounds.width, height: 250)
        }
        switch status {
        case .grid:
            return CGSize(width: (UIScreen.main.bounds.width - 40) / 2, height: 300)
        case .row:
            return CGSize(width: collectionView.bounds.width, height: 150)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        switch status {
        case .grid:
            return 20
        case .row:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        switch status {
        case .grid:
            return 20
        case .row:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        switch status {
        case .grid:
            return UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
        case .row:
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }
}


