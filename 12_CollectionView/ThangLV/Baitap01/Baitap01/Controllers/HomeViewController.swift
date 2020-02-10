//
//  HomeViewController.swift
//  Baitap01
//
//  Created by PCI0008 on 1/15/20.
//  Copyright © 2020 PCI0008. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    private let cellName = "CustomCollectionViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
        collectionView.dataSource = self
    }
    
    private func configCollectionView() {
        let cellNib = UINib(nibName: cellName, bundle: .main)
        collectionView.register(cellNib, forCellWithReuseIdentifier: cellName)
    }
}

extension HomeViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 105
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellName, for: indexPath) as! CustomCollectionViewCell
        let number: Int = indexPath.row
        let strNumber: String = String(number)
        cell.configData(number: strNumber)
        return cell
    }
}


