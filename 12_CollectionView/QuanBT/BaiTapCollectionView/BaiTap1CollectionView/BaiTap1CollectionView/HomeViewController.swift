//
//  HomeViewController.swift
//  BaiTap1CollectionView
//
//  Created by Sếp Quân on 4/5/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    private let users: [Int] = Array(0...100)
    
    // MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        let nib = UINib(nibName: "HomeCell", bundle: Bundle.main)
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeCell
        let item = users[indexPath.row]
        cell.buttonCell.setTitle(String(item), for: .normal)
        return cell
    }
}
