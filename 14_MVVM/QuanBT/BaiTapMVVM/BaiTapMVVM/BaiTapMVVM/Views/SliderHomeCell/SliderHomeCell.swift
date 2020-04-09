//
//  SliderHomeCell.swift
//  BaiTapMVVM
//
//  Created by Sếp Quân on 4/9/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit

final class SliderHomeCell: UICollectionViewCell {
    // MARK: - IBOutlet
    @IBOutlet private weak var sliderCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    // MARK: - Properties
    var dataSliders: [String] = []
    private var index = 0
    
    // MARK: - Override
    override func awakeFromNib() {
        super.awakeFromNib()
        let nib = UINib(nibName: "SliderHomeCell", bundle: Bundle.main)
        sliderCollectionView.register(nib, forCellWithReuseIdentifier: "SliderHomeCell")
        sliderCollectionView.dataSource = self
        sliderCollectionView.delegate = self
        sliderCollectionView.bounces = false
    }
    
    // MARK: - IBAction
    @IBAction private func turnLeftTouchUpInside(_ sender: Any) {
        if index > 0 {
            index -= 1
            sliderCollectionView.scrollToItem(at: IndexPath(item: self.index, section: 0), at: .centeredHorizontally, animated: true)
            pageControl.currentPage = index
        }
        
    }
    @IBAction private func turnRightTouchUpInside(_ sender: Any) {
        if index < dataSliders.count - 1 {
            index += 1
            sliderCollectionView.scrollToItem(at: IndexPath(item: self.index, section: 0), at: .centeredHorizontally, animated: true)
            pageControl.currentPage = index
        }
    }
}

// MARK: - UICollectionViewDataSource
extension SliderHomeCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSliders.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SliderHomeCell", for: indexPath) as! ImageCell
        cell.imageView.image = UIImage(named: dataSliders[indexPath.row])
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension SliderHomeCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 300)
    }
}
