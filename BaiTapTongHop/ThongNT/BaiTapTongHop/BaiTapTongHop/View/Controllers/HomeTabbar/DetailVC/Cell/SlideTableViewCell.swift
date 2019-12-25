//
//  SlideTableViewCell.swift
//  BaiTapTongHop
//
//  Created by PhuocNguyen on 12/25/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import UIKit

final class SlideTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    let cellRegister: String = "SlideImageCollectionViewCell"
    
//    var viewModel: DetailCellViewModel?
    var imageURLs: [String] = [] {
        didSet {
            collectionView.reloadData()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func updateUI() {
        collectionView.reloadData()
    }

    func setupUI() {
        collectionView.register(SlideImageCollectionViewCell.self, forCellWithReuseIdentifier: cellRegister)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension SlideTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageURLs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellRegister, for: indexPath) as? SlideImageCollectionViewCell else { return UICollectionViewCell() }
        cell.imageString = imageURLs[indexPath.row]
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
//    }
}

