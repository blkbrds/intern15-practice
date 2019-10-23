//
//  PhotoStreamViewController.swift
//  CollectionViewFlowLayout
//
//  Created by PhuocNguyen on 10/21/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

final class PhotoStreamViewController: UIViewController {

    private var images: [String] = ["iron", "Thor", "captain", "wolver", "doctor", "hulk" , "xprofessor", "hawkeye", "spider", "starlord", "deadpool", "jean", "storm", "magneto", "gamora", "rocket"]
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
    }

    private func configCollectionView() {
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "PhotoCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "Cell")
        let layout = PinterestLayout()
        layout.delegate = self
        layout.configLayout()
        collectionView.collectionViewLayout = layout
    }
}

extension PhotoStreamViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! PhotoCollectionViewCell
        cell.configPhotoImage(image: UIImage(named: images[indexPath.row]))
        return cell
    }
}

extension PhotoStreamViewController: PinterestLayoutDelegate {
    
    func collectionView(_ collectionView: UICollectionView, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
        guard let image = UIImage(named: images[indexPath.row]) else { return .zero }
        return image.size
    }
}
