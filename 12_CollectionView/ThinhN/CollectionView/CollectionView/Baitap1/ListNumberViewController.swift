//
//  ListNumberViewController.swift
//  CollectionView
//
//  Created by PCI0019 on 7/2/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class ListNumberViewController: UIViewController {
    
//    let label: UILabel = CGRect(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY, width: 100, height: 100)
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    var numbers: [Int] = Array(0...100)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
//        let label = UILabel(frame: CGRect(x: 0, y: self.view.center.y, width: 50, height: 50))
//        view.addSubview(label)
    }
    
    func configCollectionView() {
        let nib = UINib(nibName: "NumberCollectionViewCell", bundle: Bundle.main)
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
    }
}
extension ListNumberViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numbers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? NumberCollectionViewCell else { return UICollectionViewCell() }
        cell.numberLabel.text = String(numbers[indexPath.row])
        return cell
    }
}
