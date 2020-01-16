//
//  PhotoStreamViewController.swift
//  Baitap02
//
//  Created by PCI0008 on 1/16/20.
//  Copyright © 2020 PCI0008. All rights reserved.
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
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? PhotoCollectionViewCell else {
            return UICollectionViewCell()
        }
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
