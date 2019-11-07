//
//  SliderTableViewCell.swift
//  CollectionView4
//
//  Created by PhuocNguyen on 10/22/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

final class SliderTableViewCell: UITableViewCell {
    
    var data: [UIImage] = []
    private var index: CGFloat = 0
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
    }
    
    @IBAction private func pushToNextImage(_ sender: Any) {
        if Int(index) < data.count - 1 {
            index += 1
            collectionView.scrollToItem(at: IndexPath(item: Int(self.index), section: 0), at: .centeredHorizontally, animated: true)
        }
    }
    
    @IBAction private func popPreImage(_ sender: Any) {
        if index > 0 {
            index -= 1
            collectionView.scrollToItem(at: IndexPath(item: Int(self.index), section: 0), at: .centeredHorizontally, animated: true)
        }
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "HomeCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "HomeCollectionCell")
        collectionView.bounces = false
    }
}

//MARK: - tableviewDatasource, tableviewDelegate
extension SliderTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionCell", for: indexPath) as? HomeCollectionViewCell else { return UICollectionViewCell() }
        cell.configUI(avatarImage: data[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 300)
    }
}
