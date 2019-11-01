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
    
    enum Action {
        case refresh
        case loadMore
        case loadData
        case changeStatus
    }
    
    private var status: HomeShowStatus = .row {
        didSet{
            updateUI(with: .changeStatus)
        }
    }
    private var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    override func loadData() {
        viewModel.loadData(loadMore: false) { [weak self] done, error in
            guard let self = self else { return }
            if done {
                self.updateUI(with: .loadData)
            } else {
                self.showErrorAlert(with: error)
            }
        }
    }
    
    override func setupUI() {
        title = "Home"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: status.image, style: .plain, target: self, action: #selector(changeMode))
        //viewModel.delegate = self
        
        homeCollectionView.register(withNib: HomeCollectionViewCell.self)
        homeCollectionView.register(withNib: HomeGridCollectionViewCell.self)
        homeCollectionView.register(withNib: HomeSlideCollectionViewCell.self)
        homeCollectionView.refreshControl = UIRefreshControl()
        homeCollectionView.refreshControl?.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
    }
    
    func updateUI(with perform: Action) {
        switch perform {
        case .refresh:
            homeCollectionView.reloadData()
            homeCollectionView.refreshControl?.endRefreshing()
        case .changeStatus:
            switch status {
            case .grid:
                navigationItem.rightBarButtonItem = UIBarButtonItem(image: status.image, style: .plain, target: self, action: #selector(changeMode))
                homeCollectionView.reloadData()
            case .row:
                navigationItem.rightBarButtonItem = UIBarButtonItem(image: status.image, style: .plain, target: self, action: #selector(changeMode))
                homeCollectionView.reloadData()
            }
        case .loadMore:
            homeCollectionView.reloadData()
        case .loadData:
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
    
    @objc private func refreshData() {
        viewModel.loadData(loadMore: false) { [weak self] done, error in
            guard let self = self else { return }
            if done {
                self.updateUI(with: .refresh)
            } else {
                self.showErrorAlert(with: error)
            }
        }
    }
    
    func showErrorAlert(with message: String) {
        let alert = UIAlertController(title: "Warning", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
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
            let cell = collectionView.dequeueReusableCell(with: HomeSlideCollectionViewCell.self, indexPath: indexPath)
            cell.viewModel = HomeSlideCollectionCellViewModel(slideImages: viewModel.getSlideImage())
            return cell
        }
        switch status {
        case .row:
            let cell = collectionView.dequeueReusableCell(with: HomeCollectionViewCell.self, indexPath: indexPath)
            cell.viewModel = HomeCollectionCellViewModel(video: viewModel.getVideo(at: indexPath))
            cell.videoImageView.setImageWith(urlString: viewModel.getVideo(at: indexPath).imageURL, index: indexPath.row)
            cell.delegate = self
            return cell
        case .grid:
            let cell = collectionView.dequeueReusableCell(with: HomeGridCollectionViewCell.self, indexPath: indexPath)
            cell.viewModel = HomeCollectionCellViewModel(video: viewModel.getVideo(at: indexPath))
            cell.videoImageView.setImageWith(urlString: viewModel.getVideo(at: indexPath).imageURL, index: indexPath.row)
            cell.delegate = self
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section != 0 {
            let detailVC = DetailViewController()
            //            detailVC.viewModel = DetailViewModel(namePlace: viewModel.getItemAtIndexPath(indexPath).name)
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
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == viewModel.getCount() - 4 {
            viewModel.loadData(loadMore: true) { [weak self] done, error  in
                guard let self = self else { return }
                if done {
                    collectionView.reloadData()
                } else {
                    self.showErrorAlert(with: error)
                }
            }
        }
    }
}

extension HomeViewController: HomeCollectionViewCellDelegate {
    
    func favoriteItem(at cell: UICollectionViewCell) {
        //        guard let index = homeCollectionView.indexPath(for: cell) else { return }
        //        viewModel.likePlace(at: index.item) { done in
        //            if done {
        //                homeCollectionView.reloadItems(at: [index])
        //            }
        //        }
    }
}
