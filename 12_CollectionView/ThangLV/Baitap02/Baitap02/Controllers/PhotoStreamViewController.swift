//
//  PhotoStreamViewController.swift
//  Baitap02
//
//  Created by PCI0008 on 1/16/20.
//  Copyright © 2020 PCI0008. All rights reserved.
//

import UIKit

final class PhotoStreamViewController: UIViewController {

    private var imageNames: [String] = ["iron", "Thor", "captain", "wolver", "doctor", "hulk" , "xprofessor", "hawkeye", "spider", "starlord", "deadpool", "jean", "storm", "magneto", "gamora", "rocket"]
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    private let cellName: String = "PhotoCollectionViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
    }

    private func configCollectionView() {
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: cellName, bundle: .main), forCellWithReuseIdentifier: cellName)
        let layout = PinterestLayout()
        layout.delegate = self
        layout.configLayout()
        collectionView.collectionViewLayout = layout
    }
}

extension PhotoStreamViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellName, for: indexPath) as? PhotoCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configPhotoImage(image: UIImage(named: imageNames[indexPath.row]))
        return cell
    }
}

extension PhotoStreamViewController: PinterestLayoutDelegate {
    
    func collectionView(_ collectionView: UICollectionView, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
        guard let image = UIImage(named: imageNames[indexPath.row]) else { return .zero }
        return image.size
    }
}
