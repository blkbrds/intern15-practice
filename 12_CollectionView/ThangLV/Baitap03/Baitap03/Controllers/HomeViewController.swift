//
//  HomeViewController.swift
//  Baitap03
//
//  Created by PCI0008 on 1/15/20.
//  Copyright © 2020 PCI0008. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    
    struct Config {
       static let sizeForCollectionItem: CGSize = CGSize(width: 70, height: 70)
       static let referenceSizeForHeaderInSection: CGSize = CGSize(width: 90, height: 30)
    }

    @IBOutlet private weak var collectionView: UICollectionView!

    private let sections = [[1, 2, 3], [1, 2, 3, 4, 5, 6, 7], [1, 2, 3, 4, 5], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7], [1, 2, 3, 4, 5, 6, 7], [1, 2, 3, 4, 5, 6, 7]]
    
    private let customCollectionViewCell: String = "CustomCollectionViewCell"
    private let headerReusableView: String = "HeaderReusableView"

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "HOME"
        configCollectionView()
    }

    private func configCollectionView() {
        let cellNib = UINib(nibName: customCollectionViewCell, bundle: .main)
        collectionView.register(cellNib, forCellWithReuseIdentifier: customCollectionViewCell)
        let headerNib = UINib(nibName: headerReusableView, bundle: .main)
        collectionView.register(headerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerReusableView)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension HomeViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: customCollectionViewCell, for: indexPath)
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader else {
            return UICollectionReusableView()
        }
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerReusableView, for: indexPath) as! HeaderReusableView
        view.configData(section: "Section \(String(indexPath.section + 1))")
        return view
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return Config.referenceSizeForHeaderInSection
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return Config.sizeForCollectionItem
    }
}
