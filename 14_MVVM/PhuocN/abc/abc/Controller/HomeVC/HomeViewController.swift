//
//  HomeViewController.swift
//  abc
//
//  Created by PhuocNguyen on 10/22/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit
import RealmSwift

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
    private var notificationToken: NotificationToken?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    override func loadData() {
        viewModel.loadAllVideo { [weak self] done, error in
            guard let self = self else { return }
            if done {
                self.updateUI(with: .loadData)
            } else {
                self.updateUI(with: .loadData)
                self.showErrorAlert(with: error)
            }
        }
    }
    
    override func setupUI() {
        title = "Home"
        let changeStatusButton = UIBarButtonItem(image: status.image, style: .plain, target: self, action: #selector(changeMode))
        let searchButton = UIBarButtonItem(image: UIImage(named: "ic-search"), style: .plain, target: self, action: #selector(search))
        navigationItem.rightBarButtonItems = [changeStatusButton, searchButton]
        
        homeCollectionView.register(withNib: HomeCollectionViewCell.self)
        homeCollectionView.register(withNib: HomeGridCollectionViewCell.self)
        homeCollectionView.register(withNib: HomeSlideCollectionViewCell.self)
        homeCollectionView.register(withNib: HomeHeaderCollectionViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader)
        homeCollectionView.refreshControl = UIRefreshControl()
        homeCollectionView.refreshControl?.tintColor = .white
        homeCollectionView.refreshControl?.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
    }
    
    private func updateUI(with perform: Action) {
        switch perform {
        case .refresh:
            homeCollectionView.reloadData()
            homeCollectionView.refreshControl?.endRefreshing()
        case .changeStatus:
            switch status {
            case .grid:
                navigationItem.rightBarButtonItems?[0] = UIBarButtonItem(image: status.image, style: .plain, target: self, action: #selector(changeMode))
                homeCollectionView.reloadData()
            case .row:
                navigationItem.rightBarButtonItems?[0] = UIBarButtonItem(image: status.image, style: .plain, target: self, action: #selector(changeMode))
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
        viewModel.loadAllVideo { [weak self] done, error in
            guard let self = self else { return }
            if done {
                self.updateUI(with: .refresh)
            } else {
                self.showErrorAlert(with: error)
            }
        }
    }
    
    @objc private func search() {
        let searchVC = SearchViewController()
        //present(searchVC, animated: true, completion: nil)
        navigationController?.pushViewController(searchVC, animated: true)
    }
    
    override func showErrorAlert(with message: String) {
        super.showErrorAlert(with: message)
        homeCollectionView.refreshControl?.endRefreshing()
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.numberOfSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getNumberRowAtSection(section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch status {
        case .row:
            let cell = collectionView.dequeueReusableCell(with: HomeCollectionViewCell.self, indexPath: indexPath)
            cell.viewModel = HomeCollectionCellViewModel(video: viewModel.getVideo(at: indexPath)!)
            cell.videoImageView.setImageWith(urlString: viewModel.getVideo(at: indexPath)!.imageURL, index: indexPath.row)
            return cell
        case .grid:
            let cell = collectionView.dequeueReusableCell(with: HomeGridCollectionViewCell.self, indexPath: indexPath)
            cell.viewModel = HomeCollectionCellViewModel(video: viewModel.getVideo(at: indexPath)!)
            cell.videoImageView.setImageWith(urlString: viewModel.getVideo(at: indexPath)!.imageURL, index: indexPath.row)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let video = viewModel.getVideo(at: indexPath),
            let cell = collectionView.cellForItem(at: indexPath) as? HomeCollectionViewCell {
            let detailVC = DetailViewController()
            detailVC.viewModel = DetailViewModel(video: video, imageVideo: cell.videoImageView.image!)
            //present(detailVC, animated: true, completion: nil)
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch status {
        case .grid:
            return CGSize(width: (collectionView.bounds.width - 40) / 2, height: 300)
        case .row:
            return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.width * 0.95)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        status.minimumSpacingOfItem
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return status.sectionInset
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerCell = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, with: HomeHeaderCollectionViewCell.self, indexPath: indexPath)
            headerCell.backgroundColor = UIColor.darkGray
            headerCell.titleLabel.text = viewModel.getRegionTitle(at: indexPath.section)
            return headerCell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 70)
    }
}
