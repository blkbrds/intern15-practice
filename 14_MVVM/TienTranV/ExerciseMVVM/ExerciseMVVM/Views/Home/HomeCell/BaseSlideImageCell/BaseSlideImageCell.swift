//
//  BaseSlideImageCell.swift
//  ExerciseMVVM
//
//  Created by PCI0002 on 12/13/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

final class BaseSlideImageCell: UICollectionViewCell {

    // MARK: - IBOutlets
    @IBOutlet private weak var leftButton: UIButton!
    @IBOutlet private weak var rightButton: UIButton!
    @IBOutlet private weak var pageControl: UIPageControl!
    @IBOutlet private weak var collectionView: UICollectionView!

    @IBAction func previousSlideTouchUpInside(_ sender: Any) {
        previousTouchUpInside()
    }
    
    @IBAction func nextSlideTouchUpInside(_ sender: Any) {
        nextTouchUpInside()
    }
    
    // MARK: - Properties
    private let slideImageCell = "SlideImageCell"
    var viewModel = BaseSlideImageCellViewModel()

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
        pageControl.numberOfPages = viewModel.numberOfItems()
        leftButton.addTarget(self, action: #selector(nextTouchUpInside), for: .touchUpInside)
        leftButton.addTarget(self, action: #selector(previousTouchUpInside), for: .touchUpInside)
    }
    
    // MARK: - @objc private funcs
    @objc private func nextTouchUpInside() {
        let visibleItems: NSArray = collectionView.indexPathsForVisibleItems as NSArray
        let currentItem: NSIndexPath = visibleItems.object(at: 0) as! NSIndexPath
        let nextItem: NSIndexPath = NSIndexPath(row: currentItem.row + 1, section: 0)
        pageControl.currentPage = nextItem.row
        pageControl.reloadInputViews()
        collectionView.scrollToItem(at: nextItem as IndexPath, at: .left, animated: true)
    }

    @objc private func previousTouchUpInside() {
        let visibleItems: NSArray = self.collectionView.indexPathsForVisibleItems as NSArray
        let currentItem: NSIndexPath = visibleItems.object(at: 0) as! NSIndexPath
        let nextItem: NSIndexPath = NSIndexPath(row: currentItem.row - 1, section: 0)
        pageControl.currentPage = nextItem.row
        pageControl.reloadInputViews()
        self.collectionView.scrollToItem(at: nextItem as IndexPath, at: .left, animated: true)
    }
}

// MARK: - Extension: UICollectionViewDataSource
extension BaseSlideImageCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let slideImageCell = collectionView.dequeueReusableCell(withReuseIdentifier: self.slideImageCell, for: indexPath) as? SlideImageCell else { return UICollectionViewCell() }
        let imageName = viewModel.getImageName(with: indexPath)
        let cellViewModel = SlideImageCellViewModel(imageName: imageName)
        slideImageCell.viewModel = cellViewModel
        return slideImageCell
    }
}

// MARK: - Extension: UICollectionViewDelegateFlowLayout
extension BaseSlideImageCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
