//
//  SliderTableViewCell.swift
//  BaiTap4CollectionView
//
//  Created by Sếp Quân on 4/6/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit

final class SliderTableViewCell: UITableViewCell {
    // MARK: - IBOutlet
    @IBOutlet private weak var sliderCollectionView: UICollectionView!
    
    // MARK: - Properties
    var dataSliders: [Int] = []
    private var index = 0
    
    // MARK: - Override
    override func awakeFromNib() {
        super.awakeFromNib()
        let nib = UINib(nibName: "HomeCell", bundle: Bundle.main)
        sliderCollectionView.register(nib, forCellWithReuseIdentifier: "HomeCell")
        sliderCollectionView.dataSource = self
        sliderCollectionView.delegate = self
        sliderCollectionView.bounces = false
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - IBAction
    @IBAction private func turnLeftTouchUpInside(_ sender: Any) {
        if index > 0 {
            index -= 1
            sliderCollectionView.scrollToItem(at: IndexPath(item: self.index, section: 0), at: .centeredHorizontally, animated: true)
        }
        
    }
    @IBAction private func turnRightTouchUpInside(_ sender: Any) {
        if index < dataSliders.count - 1 {
            index += 1
            sliderCollectionView.scrollToItem(at: IndexPath(item: self.index, section: 0), at: .centeredHorizontally, animated: true)
        }
    }
}

// MARK: - UICollectionViewDataSource
extension SliderTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSliders.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCell
        cell.cellButton.setTitle(String(dataSliders[indexPath.row]), for: .normal)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension SliderTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 20, height: 300)
    }
}
