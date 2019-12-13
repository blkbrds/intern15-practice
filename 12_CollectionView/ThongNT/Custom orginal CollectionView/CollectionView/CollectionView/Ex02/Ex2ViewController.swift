//
//  Ex2ViewController.swift
//  CollectionView
//
//  Created by PCI0018 on 11/14/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import UIKit

final class Ex2ViewController: UIViewController {

    @IBOutlet private weak var collectionView: UICollectionView!

    private var heightArray: [CGFloat] = []
    private let numberOfItems: Int = 48
    private let cellIndentifier: String = "UICollectionViewCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        randomHeightForCell()
    }

    //MARK: - Private functions
    private func setupUI() {
        title = "Random Height"
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellIndentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        if let layout = collectionView.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
        }
    }

    private func randomHeightForCell() {
        for _ in 0..<numberOfItems {
            heightArray.append(CGFloat.random(in: 50...200))
        }
    }
}

extension Ex2ViewController: UICollectionViewDelegate, UICollectionViewDataSource, PinterestLayoutDelegate {

    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        return heightArray[indexPath.item]
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfItems
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIndentifier, for: indexPath)
        cell.backgroundColor = #colorLiteral(red: 0.3236978054, green: 0.1063579395, blue: 0.574860394, alpha: 0.7382009846)
        return cell
    }
}
