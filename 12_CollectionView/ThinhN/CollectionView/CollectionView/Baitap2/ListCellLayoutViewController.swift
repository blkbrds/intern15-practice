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
    

    var imageOfCell: UIImage = UIImage(named: "download")!
    var height: [CGFloat] = [100, 70, 90, 100, 30 ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let layout = collectionView.collectionViewLayout as? ListCellLayout {
            layout.delegate = self
        }
        configCollectionView()
    }
    func configCollectionView() {
        let nib = UINib(nibName: "ImageCollectionViewCell", bundle: .main)
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self

    }
}
extension ListCellLayoutViewController: UICollectionViewDataSource , UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ImageCollectionViewCell
        cell.backgroundColor = .blue
        cell.imageView.image = imageOfCell
        return cell
    }
}
extension ListCellLayoutViewController: ListCellLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        return height[indexPath.row]
    }
    
}

