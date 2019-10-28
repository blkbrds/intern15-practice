//
//  HomeViewController.swift
//  abc
//
//  Created by PhuocNguyen on 10/22/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

enum HomeShowStatus {
    case grid
    case row
    
    var image: UIImage {
        switch self {
        case .grid:
            return #imageLiteral(resourceName: "ic-grid")
        case .row:
            return #imageLiteral(resourceName: "ic-row")
        }
    }
    
    var sectionInset: UIEdgeInsets {
        switch self {
        case .grid:
            return UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
        case .row:
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }
    
    var minimumSpacingOfItem: CGFloat {
        switch self {
        case .grid:
            return 20
        case .row:
            return 0
        }
    }
}

final class HomeViewController: BaseViewController {
    
    @IBOutlet private weak var homeCollectionView: UICollectionView!
    
    private var status: HomeShowStatus = .row {
        didSet{
            updateUI()
        }
    }
    private var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    override func loadData() {
        viewModel.loadData { (error, done) in
            if done {
                updateUI()
            }
        }
    }
    
    override func setupUI() {
        title = "Home"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: status.image, style: .plain, target: self, action: #selector(changeMode))
        
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
        homeCollectionView.register(UINib(nibName: "HomeCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "HomeCell")
        homeCollectionView.register(UINib(nibName: "HomeGridCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "HomeGridCell")
        homeCollectionView.register(UINib(nibName: "HomeSlideCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "HomeSlideCell")
    }
    
    override func updateUI() {
        switch status {
        case .grid:
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: status.image, style: .plain, target: self, action: #selector(changeMode))
            homeCollectionView.reloadData()
        case .row:
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: status.image, style: .plain, target: self, action: #selector(changeMode))
            homeCollectionView.reloadData()
        }
    }
    
    @objc private func changeMode() {
        switch status {
        case .grid:
            status = .row
        case .row:
            status = .grid
        }
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.numberOfSection
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberRowOfSection(at: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeSlideCell", for: indexPath) as! HomeSlideCollectionViewCell
            cell.viewModel = HomeSlideCollectionCellViewModel(slideImages: viewModel.getSlideImage())
            return cell
        }
        switch status {
        case .row:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCollectionViewCell
            cell.viewModel = HomeCollectionCellViewModel(place: viewModel.getItemAtIndexPath(indexPath))
            cell.delegate = self
            return cell
        case .grid:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeGridCell", for: indexPath) as! HomeGridCollectionViewCell
            cell.viewModel = HomeCollectionCellViewModel(place: viewModel.getItemAtIndexPath(indexPath))
            cell.delegate = self
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section != 0 {
            let detailVC = DetailViewController()
            detailVC.viewModel = DetailViewModel(namePlace: viewModel.getItemAtIndexPath(indexPath).name)
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: collectionView.bounds.width, height: 250)
        }
        switch status {
        case .grid:
            return CGSize(width: (collectionView.bounds.width - 40) / 2, height: 300)
        case .row:
            return CGSize(width: collectionView.bounds.width, height: 150)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        status.minimumSpacingOfItem
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return status.sectionInset
    }
}

extension HomeViewController: HomeCollectionViewCellDelegate {
    
    func favoriteItem(at cell: UICollectionViewCell) {
        guard let index = homeCollectionView.indexPath(for: cell) else { return }
        viewModel.likePlace(at: index.item)
        homeCollectionView.reloadItems(at: [index])
    }
}
