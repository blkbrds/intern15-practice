//
//  ListNumberViewController.swift
//  CollectionView
//
//  Created by PCI0019 on 7/2/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class ListNumberViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var numbers: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listNumbers()
        configCollectionView()
    }
    
    func listNumbers() {
        for i in 0...100 {
            numbers.append(i)
        }
    }
    
    func configCollectionView() {
        let nib = UINib(nibName: "NumberCollectionViewCell", bundle: Bundle.main)
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
    }
}
extension ListNumberViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        numbers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! NumberCollectionViewCell
        cell.numberLabel.text = String(numbers[indexPath.row])
        cell.numberLabel.textColor = .white
        return cell
    }
}
