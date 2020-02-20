//
//  HomeViewController.swift
//  MVVM
//
//  Created by user on 1/22/20.
//  Copyright © 2020 VienH. All rights reserved.
//

import UIKit

final class HomeViewController: BaseViewController {

    //MARK - IBOutlet
    @IBOutlet private weak var collectionView: UICollectionView!

    // MARK: - Properties
    private var rowPlaceCell = "PlaceCell"
    private var baseSlideImageCell = "BaseSlideImageCell"
    private var columnPlaceCell = "PlaceViewCell"
    private var datas: [[Place]] = []
    var viewModle = HomeViewModel()
    private var layout = Layout.row

    // MARK: - Override funcs
    override func setupUI() {
        super.setupUI()
        configNavigationBar()
        configCollectionView()
    }

    override func setupData() {
        super.setupData()
        fetchData()
    }

    // MARK: -  Private funcs
    private func configNavigationBar() {
        title = "Home"
        turnOnStandardMode()
        turnOnSmallMode()
    }

    private func configCollectionView() {
        collectionView.register(UINib(nibName: columnPlaceCell, bundle: .main), forCellWithReuseIdentifier: columnPlaceCell)
        collectionView.register(UINib(nibName: rowPlaceCell, bundle: .main), forCellWithReuseIdentifier: rowPlaceCell)
        collectionView.register(UINib(nibName: baseSlideImageCell, bundle: .main), forCellWithReuseIdentifier: baseSlideImageCell)
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    private func changeFlowLayout(layout: Layout) {
        self.layout = layout
        collectionView.reloadData()
    }

    private func fetchData() {
        viewModle.fetchData { (done, msg) in
            if done {
                collectionView.reloadData()
            } else {
                print("No load data: \(msg)")
            }
        }
    }

    @objc private func turnOnStandardMode() {
        changeFlowLayout(layout: .row)
        let standardButton = UIBarButtonItem(image: #imageLiteral(resourceName: "icons8-grid-2-30"), style: .plain, target: self, action: #selector(turnOnSmallMode))
        navigationItem.rightBarButtonItem = standardButton
    }

    @objc private func turnOnSmallMode() {
        changeFlowLayout(layout: .column)
        let smallButton = UIBarButtonItem(image: #imageLiteral(resourceName: "icons8-table-of-content-30"), style: .plain, target: self, action: #selector(turnOnStandardMode))
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

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.alpha = 0
        cell.transform = CGAffineTransform(scaleX: 0.1, y: 0.2)
        UIView.animate(withDuration: 0.25) {
            cell.alpha = 1
            cell.transform = .identity
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let baseSlideImageCell = collectionView.dequeueReusableCell(withReuseIdentifier: baseSlideImageCell, for: indexPath) as? BaseSlideImageCell else { return UICollectionViewCell() }
            let places = viewModle.getPlace(with: indexPath)
            let baseSlideImageCellViewModel = BaseSlideImageCellViewModel(places: places)
            baseSlideImageCell.viewModel = baseSlideImageCellViewModel
            return baseSlideImageCell

        default:
            let place = viewModle.getPlaces(with: indexPath)
            let cplaceCellViewModel = PlaceCellViewModel(namePlace: place.name, placeImageName: place.imageName, address: place.address, favorites: place.favorites)

            switch layout {
            case .row:
                guard let placeCell2 = collectionView.dequeueReusableCell(withReuseIdentifier: rowPlaceCell, for: indexPath) as? PlaceCell else { return UICollectionViewCell() }
                placeCell2.viewModel = cplaceCellViewModel
                placeCell2.delegate = self
                return placeCell2
            case .column:
                guard let placeCell = collectionView.dequeueReusableCell(withReuseIdentifier: columnPlaceCell, for: indexPath) as? PlaceCell else { return UICollectionViewCell() }
                placeCell.viewModel = cplaceCellViewModel
                placeCell.delegate = self
                return placeCell
            }
        }
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            return layout.sectionOneSize
        default:
            switch layout {
            case .column:
                return layout.itemSize
            case .row:
                return layout.itemSize
            }
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return layout.sectionInset
    }
}

extension HomeViewController: PlaceCellDelegate {
    func viewCell(viewCell: PlaceCell, needPermorAction action: PlaceCell.Action) {
        switch action {
        case .changeFavorites:
            guard let index = collectionView.indexPath(for: viewCell) else { return }
            viewModle.changeFavorites(with: index) { (done, msg) in
                if done {
                    collectionView.reloadItems(at: [index])
                } else {
                    print("Error: \(msg)")
                }
            }
        }
    }
}

extension HomeViewController {
    enum Layout {
        case row
        case column

        var itemSize: CGSize {
            switch self {
            case .row: return CGSize(width: UIScreen.main.bounds.width - 20, height: 120)
            case .column: return CGSize(width: UIScreen.main.bounds.width / 2 - 15, height: 170)
            }
        }

        var sectionInset: UIEdgeInsets {
            return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        }

        var sectionOneSize: CGSize {
            return CGSize(width: UIScreen.main.bounds.width - 20, height: 220)
        }
    }

}
