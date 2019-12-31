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

    private let menuCategoryCell = "MenuCategoryCell"
    private let menuCategory = ["U.S", "World", "Business", "Technology", "General", "Health", "Science", "Sports", "Entertainment"]

    override func setupUI() {
        super.setupUI()
        title = "Headlines"

        configMenuCategoryCollectionView()
    }

    private func configMenuCategoryCollectionView() {
        menuCategoryCollectionView.register(UINib(nibName: menuCategoryCell, bundle: .main), forCellWithReuseIdentifier: menuCategoryCell)
        menuCategoryCollectionView.delegate = self
        menuCategoryCollectionView.dataSource = self
    }
}

extension HeadlinesViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        menuCategory.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let menuCell = menuCategoryCollectionView.dequeueReusableCell(withReuseIdentifier: menuCategoryCell, for: indexPath) as? MenuCategoryCell else { return UICollectionViewCell() }
        menuCell.configUI(category: menuCategory[indexPath.row])
        return menuCell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        menuCategoryCollectionView.cellForItem(at: indexPath)?.backgroundColor = .systemBlue
        for i in 0..<menuCategory.count where i != indexPath.row {
            menuCategoryCollectionView.cellForItem(at: IndexPath(row: i, section: indexPath.section))?.backgroundColor = .white
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 150, height: menuCategoryCollectionView.bounds.height)
    }
}
