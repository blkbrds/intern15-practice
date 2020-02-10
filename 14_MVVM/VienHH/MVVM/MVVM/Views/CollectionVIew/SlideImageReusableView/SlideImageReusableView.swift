//
//  SlideImageReusableView.swift
//  MVVM
//
//  Created by user on 2/7/20.
//  Copyright © 2020 VienH. All rights reserved.
//

import UIKit

class SlideImageReusableView: UICollectionReusableView {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Properties
        private let slideImageCell = "SlideImageCell"
        var viewModel = SlideImageReusableViewModel()

        override func awakeFromNib() {
            super.awakeFromNib()
            configUI()
        }

        // MARK: - Private funcs
        private func configCollectionView() {
            collectionView.register(UINib(nibName: slideImageCell, bundle: .main), forCellWithReuseIdentifier: slideImageCell)
            collectionView.dataSource = self
            collectionView.delegate = self
        }

        private func configUI() {
            configCollectionView()
            self.bringSubviewToFront(pageControl)
        }
    }

    // MARK: - Extension: UICollectionViewDataSource
    extension SlideImageReusableView: UICollectionViewDataSource {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            pageControl.numberOfPages = viewModel.numberOfItems()
            return viewModel.numberOfItems()
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let slideImageCell = collectionView.dequeueReusableCell(withReuseIdentifier: self.slideImageCell, for: indexPath) as? SlideImageCell else { return UICollectionViewCell() }
            let imageName = viewModel.getImageName(with: indexPath)
            let cellViewModel = SlideImageCellViewModel(imageName: imageName)
            slideImageCell.viewModel = cellViewModel
            return slideImageCell
        }

        func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
            pageControl.currentPage = indexPath.row
        }
    }

    // MARK: - Extension: UICollectionViewDelegateFlowLayout
    extension SlideImageReusableView: UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 0
        }
    }
