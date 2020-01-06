//
//  HomeSlideCollectionViewCell.swift
//  abc
//
//  Created by PhuocNguyen on 10/24/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

final class HomeSlideCollectionViewCell: UICollectionViewCell {
    
    //MARK: -IBOutlet
    @IBOutlet private weak var pageControll: UIPageControl!
    @IBOutlet private weak var collectionView: UICollectionView!
    
    var viewModel: HomeSlideCollectionCellViewModel? {
        didSet {
            updateUI()
        }
    }
    
    //MARK: -config
    func updateUI() {
        collectionView.register(withNib: SlideCollectionViewCell.self)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    @IBAction private func pageControllChangeValue(_ sender: UIPageControl) {
        if sender.currentPage == 5 {
            sender.currentPage = 1
        }
        collectionView.scrollToItem(at: IndexPath(item: sender.currentPage, section: 0), at: .centeredHorizontally, animated: true)
    }
}

extension HomeSlideCollectionViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { fatalError("Don't have any image")}
        return viewModel.slideImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(with: SlideCollectionViewCell.self, indexPath: indexPath)
        guard let viewModel = viewModel else { fatalError("Don't have any image") }
        cell.setupImage(with: UIImage(named: viewModel.slideImages[indexPath.row]))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
}
