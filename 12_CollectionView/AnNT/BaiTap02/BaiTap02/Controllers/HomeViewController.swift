//
//  HomeViewController.swift
//  BaiTap02
//
//  Created by An Nguyễn on 1/4/20.
//  Copyright © 2020 An Nguyễn. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var myCollectionView: UICollectionView!

    private let images = ["pasta0", "pasta1", "pasta2", "pasta3", "pasta4", "pasta5", "pasta6",
        "pizza0", "pizza1", "pizza2", "pizza3", "pizza4", "pizza5", "pizza6"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        loadNib()
        let layout = PinterestLayout()
        myCollectionView.collectionViewLayout = layout
        layout.delegate = self
    }

    private func loadNib() {
        let nib = UINib(nibName: "MyCollectionViewCell", bundle: .main)
        myCollectionView.register(nib, forCellWithReuseIdentifier: "myCVCelll")
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCVCelll", for: indexPath) as! MyCollectionViewCell
        if let image = UIImage(named: images[indexPath.row]) {
            cell.foodImageView.image = image
        }
        return cell
    }
}

extension HomeViewController: PinterestLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
        guard let image = UIImage(named: self.images[indexPath.row]) else {
            return CGSize(width: 0, height: 0)
        }
        return image.size
    }
}
