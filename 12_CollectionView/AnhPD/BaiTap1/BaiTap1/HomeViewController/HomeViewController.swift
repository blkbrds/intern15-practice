//
//  HomeViewController.swift
//  BaiTap1
//
//  Created by PCI0012 on 5/27/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {

    @IBOutlet private weak var collectionView: UICollectionView!
    
    private var numbers: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
        updateNumbers()
    }
    
    private func configCollectionView() {
        let nib = UINib(nibName: "HomeCell", bundle: .main)
        collectionView.register(nib, forCellWithReuseIdentifier: "HomeCell")
        collectionView.dataSource = self
    }
    
    private func updateNumbers() {
        for index in 1...50 {
            numbers.append(index)
        }
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numbers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as? HomeCell ?? HomeCell()
        cell.numberLabel.text = String(numbers[indexPath.row])
        return cell
    }
}
