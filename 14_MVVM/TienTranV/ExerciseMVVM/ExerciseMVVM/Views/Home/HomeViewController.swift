//
//  HomeViewController.swift
//  ExerciseTabbarController
//
//  Created by PCI0002 on 12/11/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

final class HomeViewController: BaseViewController {

    enum Status {
        case row
        case grid

        var itemSize: CGSize {
            switch self {
            case .row: return CGSize(width: UIScreen.main.bounds.width - 20, height: 150)
            case .grid: return CGSize(width: UIScreen.main.bounds.width / 2 - 15, height: 150)
            }
        }

        var sectionInset: UIEdgeInsets {
            return UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        }

        var sectionOneSize: CGSize {
            return CGSize(width: UIScreen.main.bounds.width - 20, height: 150)
        }
    }

    // MARK: - IBOutlets
    @IBOutlet private weak var collectionView: UICollectionView!

    // MARK: - Properties
    private var gridLocationCell = "GridLocationCell"
    private var rowLocationCell = "RowLocationCell"
    private var baseSlideImageCell = "BaseSlideImageCell"
    private var datas: [[Location]] = []
    var viewModle = HomeViewModel()
    private var status = Status.row

    // MARK: - Override funcs
    override func setupUI() {
        super.setupUI()
        turnOnStandardMode()
        configNavigationBar()
        configCollectionView()
    }

    // MARK: -  Private funcs
    func configNavigationBar() {
        title = "Home"
    }

    func configCollectionView() {
        collectionView.register(UINib(nibName: gridLocationCell, bundle: .main), forCellWithReuseIdentifier: gridLocationCell)
        collectionView.register(UINib(nibName: rowLocationCell, bundle: .main), forCellWithReuseIdentifier: rowLocationCell)
        collectionView.register(UINib(nibName: baseSlideImageCell, bundle: .main), forCellWithReuseIdentifier: baseSlideImageCell)
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    private func changeFlowLayout(status: Status) {
        self.status = status
        collectionView.reloadData()
    }

    @objc private func turnOnStandardMode() {
        changeFlowLayout(status: .row)
        let standardButton = UIBarButtonItem(image: #imageLiteral(resourceName: "ic-squared-menu"), style: .plain, target: self, action: #selector(turnOnSmallMode))
        navigationItem.rightBarButtonItem = standardButton
    }

    @objc private func turnOnSmallMode() {
        changeFlowLayout(status: .grid)
        let smallButton = UIBarButtonItem(image: #imageLiteral(resourceName: "ic-menu"), style: .plain, target: self, action: #selector(turnOnStandardMode))
        navigationItem.rightBarButtonItem = smallButton
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModle.getNumberOfSection()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModle.getNumberOfItems(section)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let baseSlideImageCell = collectionView.dequeueReusableCell(withReuseIdentifier: baseSlideImageCell, for: indexPath) as? BaseSlideImageCell else { return UICollectionViewCell() }
            let locations = viewModle.getLocations(with: indexPath)
            let baseSlideImageCellViewModel = BaseSlideImageCellViewModel(locations: locations)
            baseSlideImageCell.viewModel = baseSlideImageCellViewModel
            return baseSlideImageCell

        default:
            let location = viewModle.getLocation(with: indexPath)
            let clocationCellViewModel = LocationCellViewModel(nameLocation: location.name, locationImageName: location.imageName, address: location.address)

            switch status {
            case .row:
                guard let locationCell2 = collectionView.dequeueReusableCell(withReuseIdentifier: rowLocationCell, for: indexPath) as? LocationCell else { return UICollectionViewCell() }
                locationCell2.viewModel = clocationCellViewModel
                return locationCell2
            case .grid:
                guard let locationCell = collectionView.dequeueReusableCell(withReuseIdentifier: gridLocationCell, for: indexPath) as? LocationCell else { return UICollectionViewCell() }
                locationCell.viewModel = clocationCellViewModel
                return locationCell
            }
        }
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            return status.sectionOneSize
        default:
            switch status {
            case .grid:
                return status.itemSize
            case .row:
                return status.itemSize
            }
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return status.sectionInset
    }
}
