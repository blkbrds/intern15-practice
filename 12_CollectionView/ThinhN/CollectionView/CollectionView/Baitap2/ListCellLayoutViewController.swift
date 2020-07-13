//
//  ListCellLayoutViewController.swift
//  CollectionView
//
//  Created by PCI0019 on 7/2/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit
class ListCellLayoutViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var height: [CGFloat] = [20, 70, 90, 100, 30,90, 22, 100,50,60, 10]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let layout = collectionView.collectionViewLayout as? HomeLayout {
            layout.dataSource = self
        }
        configCollectionView()
    }
    
    func configCollectionView() {
//        let nib = UINib(nibName: "ImageCollectionViewCell", bundle: .main)
//        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "collectionCell")
        
        collectionView.dataSource = self
    }
}
extension ListCellLayoutViewController: UICollectionViewDataSource , UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return height.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ImageCollectionViewCell else { return UICollectionViewCell() }
        cell.imageView.image = UIImage(named: "download")
        return cell
//        let image: UIImage {
//            image
//        }
        
    }
}
extension ListCellLayoutViewController: HomeLayoutDataSource {
    func getNumberOfColumn() -> Int {
        return 3
    }
    
    func collectionView(_ controller: UICollectionView, heightForColumnAtIndexPath indexPath: IndexPath) -> CGFloat {
        return height[indexPath.row]
    }
}
