//
//  Ex02ViewController.swift
//  BaiTap12-collectionView
//
//  Created by ANH NGUYỄN on 11/28/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import UIKit

class Ex02ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    let images: [UIImage] = [#imageLiteral(resourceName: "goku6"), #imageLiteral(resourceName: "goku5"), #imageLiteral(resourceName: "goku"), #imageLiteral(resourceName: "goku7"), #imageLiteral(resourceName: "goku3"), #imageLiteral(resourceName: "goku4"), #imageLiteral(resourceName: "goku6")]
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        if let layout = collectionView?.collectionViewLayout as? PinterestCollectionView {
            layout.delegate = self
        }
    }

    func setUpUI() {
        let nib = UINib(nibName: "Ex02CollectionViewCell", bundle: Bundle.main)
        collectionView.register(nib, forCellWithReuseIdentifier: "Ex02CollectionViewCell")
        collectionView.dataSource = self
    }
}
extension Ex02ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Ex02CollectionViewCell", for: indexPath) as! Ex02CollectionViewCell
        let image = images[indexPath.item]
        cell.imageView.image = image
        return cell
    }
}

extension Ex02ViewController: PinterestCollectionViewDelegate {
    func collectionView(_ _collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGSize {
        let image = images[indexPath.item]
        return image.size
    }
}
