//
//  ExerciseThreeViewController.swift
//  ExerciseCollectionView
//
//  Created by PCI0002 on 12/10/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

final class ExerciseThreeViewController: BaseViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var collectionView: UICollectionView!

    // MARK: - Properties
    private var avatars: [[Avatar]] = []
    private let avatarCellText = "AvatarCell"
    private let avatarHeaderText = "CollectionReusableView"

    // MARK: - Override funcs
    override func setupUI() {
        super.setupUI()
        configCollectionView()
        configNavigationBar()
    }

    override func setupData() {
        super.setupData()
        avatars.append(DummyData.dsHaiTac)
        avatars.append(DummyData.dsHaiTacMuRom)
        avatars.append(DummyData.girls)
    }

    // MARK: - Private funcs
    private func configCollectionView() {
        collectionView.register(UINib(nibName: avatarCellText, bundle: .main), forCellWithReuseIdentifier: avatarCellText)
        collectionView.register(UINib(nibName: avatarHeaderText, bundle: .main), forSupplementaryViewOfKind: avatarHeaderText, withReuseIdentifier: avatarHeaderText)
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    private func configNavigationBar() {
        title = "Exercise 3"
    }
}

// MARK: - Extension: UICollectionViewDataSource
extension ExerciseThreeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return avatars.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return avatars[section].count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let avatarCell = collectionView.dequeueReusableCell(withReuseIdentifier: self.avatarCellText, for: indexPath) as! AvatarCell
        avatarCell.configUI { () -> Avatar in
            return avatars[indexPath.section][indexPath.row]
        }
        return avatarCell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: avatarHeaderText, withReuseIdentifier: avatarHeaderText, for: indexPath) as! CollectionReusableView
            sectionHeader.configUI { () -> String in
                switch indexPath.section {
                case 0:
                    return "Hải Tặc Mũ Rơm"
                case 1:
                    return "Hải Tặc Mũ Rơm"
                default:
                    return "Gái 😍😍"
                }
            }
            return sectionHeader
        default:
            fatalError("Unexpected element kind")
        }
    }
}

// MARK: - Extension: UICollectionViewDelegateFlowLayout
extension ExerciseThreeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 220)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 45)
    }
}
