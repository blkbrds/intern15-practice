//
//  BaseCollectionViewCell.swift
//  ExerciseCollectionView
//
//  Created by PCI0002 on 12/10/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

final class BaseCollectionViewCell: UICollectionViewCell {

    // MARK: - IBOutlets
    @IBOutlet private weak var collectionView: UICollectionView!

    // MARK: - Properties
    private let avatarCell = "AvatarCell"
    private var avatars: [Avatar] = []
    private var section: Int?
    typealias GetAvatars = () -> [Avatar]
    typealias GetSection = () -> Int

    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        configCollectionView()
    }

    // MARK: - Public funcs
    func configData(getAvatars: GetAvatars, getSection: GetSection) {
        self.avatars = getAvatars()
        self.section = getSection()
    }

    // MARK: - Private funcs
    private func configCollectionView() {
        collectionView.register(UINib(nibName: avatarCell, bundle: .main), forCellWithReuseIdentifier: avatarCell)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

// MARK: - Extension: UICollectionViewDataSource
extension BaseCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return avatars.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let avatarCell = collectionView.dequeueReusableCell(withReuseIdentifier: self.avatarCell, for: indexPath) as! AvatarCell
        avatarCell.configUI { () -> Avatar in
            return avatars[indexPath.row]
        }
        return avatarCell
    }
}

// MARK: - Extension: UICollectionViewDelegateFlowLayout
extension BaseCollectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let section = section else { return CGSize(width: 0, height: 0) }
        switch section {
        case 0:
            return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
        default:
            return CGSize(width: 80, height: collectionView.bounds.height - 20)
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        guard let section = self.section else { return 0 }
        switch section {
        case 0:
            return 0
        default:
            return 10
        }
    }
}
