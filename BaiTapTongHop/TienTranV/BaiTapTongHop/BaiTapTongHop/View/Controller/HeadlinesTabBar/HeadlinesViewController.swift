//
//  HeadlinesViewController.swift
//  BaiTapTongHop
//
//  Created by PCI0002 on 12/30/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

final class HeadlinesViewController: BaseViewController {


    @IBOutlet weak var menuCategoryCollectionView: UICollectionView!
    
    private var selectedIndex = 0
    private let menuCategoryCell = "MenuCategoryCell"
    private let menuCategory = ["U.S", "World", "Business", "Technology", "General", "Health", "Science", "Sports", "Entertainment"]

    override func setupUI() {
        super.setupUI()
        title = "Headlines"

        configMenuCategoryCollectionView()
    }

    private func configMenuCategoryCollectionView() {
        menuCategoryCollectionView.register(UINib(nibName: menuCategoryCell, bundle: .main), forCellWithReuseIdentifier: menuCategoryCell)
        menuCategoryCollectionView.dataSource = self
        menuCategoryCollectionView.delegate = self

        if let flowLayout = menuCategoryCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
        }
    }
}

extension HeadlinesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        menuCategory.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let menuCell = menuCategoryCollectionView.dequeueReusableCell(withReuseIdentifier: menuCategoryCell, for: indexPath) as? MenuCategoryCell else { return UICollectionViewCell() }
        menuCell.configUI(category: menuCategory[indexPath.row], isEnable: indexPath.row == selectedIndex)
        return menuCell
    }
}

extension HeadlinesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
//        collectionView.reloadData()
        for i in 0..<menuCategory.count where menuCategory[i] != menuCategory[indexPath.row] {
            if let cell = collectionView.cellForItem(at: IndexPath(item: i, section: 0)) as? MenuCategoryCell {
                cell.configUI(category: menuCategory[i], isEnable: i == selectedIndex)
            }
        }
    }
}
