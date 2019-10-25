//
//  HomeSlideCollectionViewCell.swift
//  abc
//
//  Created by PhuocNguyen on 10/24/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

final class HomeSlideCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var pageControll: UIPageControl!
    @IBOutlet private weak var collectionView: UICollectionView!
    
    var viewModel: HomeSlideCollectionCellViewModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //pageControll.
    }
    
    func configCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "SlideCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "Cell")
    }
    
    @IBAction func pageControllChangeValue(_ sender: UIPageControl) {
        if sender.currentPage == 5 {
            sender.currentPage = 1
        }
        collectionView.scrollToItem(at: IndexPath(item: sender.currentPage, section: 0), at: .centeredHorizontally, animated: true)
    }
}

extension HomeSlideCollectionViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { fatalError("Don't have any image")}
        return viewModel.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! SlideCollectionViewCell
        guard let viewModel = viewModel else { fatalError("Don't have any image") }
        cell.setupImage(with: UIImage(named: viewModel.data[indexPath.row]))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
}
