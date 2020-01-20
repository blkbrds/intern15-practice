//
//  CustomCollectionViewCell.swift
//  baitap3+4
//
//  Created by user on 12/25/19.
//  Copyright © 2019 VienH. All rights reserved.
//

import UIKit

final class CustomCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private let heroCellIndentifier: String = "HomeCellCollectionViewCell"
        var teamMembers: [Member] = []

        override func awakeFromNib() {
            super.awakeFromNib()
            configCollectionView()
        }

        //MARK: - Private functions
        private func configCollectionView() {
            let cellNib = UINib(nibName: heroCellIndentifier, bundle: .main)
            collectionView.register(cellNib, forCellWithReuseIdentifier: heroCellIndentifier)
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }

    extension CustomCollectionViewCell: UICollectionViewDataSource {

        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return teamMembers.count
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: heroCellIndentifier, for: indexPath) as? HomeCellCollectionViewCell else { return UICollectionViewCell() }
            cell.updateCell(avatar: teamMembers[indexPath.item].avatar, name: teamMembers[indexPath.item].name)
            return cell
        }
    }

    extension CustomCollectionViewCell: UICollectionViewDelegateFlowLayout {

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let height = collectionView.frame.height - 40
            return CGSize(width: 150, height: height)
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 20, left: 16, bottom: 20, right: 16)
        }
    }
