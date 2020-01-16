//
//  HomeViewController.swift
//  Baitap01
//
//  Created by PCI0008 on 1/15/20.
//  Copyright © 2020 PCI0008. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
        collectionView.dataSource = self
    }
    private func configCollectionView() {
        let cellNib = UINib(nibName: "CustomCollectionViewCell", bundle: .main)
        collectionView.register(cellNib, forCellWithReuseIdentifier: "cell")
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
        let number: Int = indexPath.row
        let strNumber: String = String(number)
        cell.numerialOrderLabel.text = strNumber
        cell.numerialOrderLabel.textColor = .white
        return cell
    }
}


