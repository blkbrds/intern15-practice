//
//  HomeViewController.swift
//  ExerciseTabbarController
//
//  Created by PCI0002 on 12/11/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

final class HomeViewController: BaseViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var collectionView: UICollectionView!

    // MARK: - Properties
    private var locationCell = "LocationCell"
    private var baseSlideImageCell = "BaseSlideImageCell"
    private var datas: [[Location]] = []
    var viewModle = HomeViewModel()

    // MARK: - Override funcs
    override func setupUI() {
        super.setupUI()
        configNavigationBar()
        configCollectionView()
    }

    // MARK: -  Private funcs
    func configNavigationBar() {
        title = "Home"
    }

    func configCollectionView() {
        collectionView.register(UINib(nibName: locationCell, bundle: .main), forCellWithReuseIdentifier: locationCell)
        collectionView.register(UINib(nibName: baseSlideImageCell, bundle: .main), forCellWithReuseIdentifier: baseSlideImageCell)
        collectionView.dataSource = self
        collectionView.delegate = self
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
        guard let locationCell = collectionView.dequeueReusableCell(withReuseIdentifier: locationCell, for: indexPath) as? LocationCell,
            let baseSlideImageCell = collectionView.dequeueReusableCell(withReuseIdentifier: baseSlideImageCell, for: indexPath) as? BaseSlideImageCell else { return UICollectionViewCell() }
        switch indexPath.section {
        case 0:
            let locations = viewModle.getLocations(with: indexPath)
            let baseSlideImageCellViewModel = BaseSlideImageCellViewModel(locations: locations)
            baseSlideImageCell.viewModel = baseSlideImageCellViewModel
            return baseSlideImageCell
        default:
            let location = viewModle.getLocation(with: indexPath)
            let clocationCellViewModel = LocationCellViewModel(nameLocation: location.name, locationImageName: location.imageName, address: location.address)
            locationCell.viewModel = clocationCellViewModel
            return locationCell
        }
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            return CGSize(width: collectionView.bounds.width - 50, height: 200)
        default:
            return CGSize(width: collectionView.bounds.width / 2 - 10, height: 150)
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
    }
}
