//
//  ExerciseFourViewController.swift
//  ExerciseCollectionView
//
//  Created by PCI0002 on 12/10/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

final class ExerciseFourViewController: BaseViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var collectionView: UICollectionView!

    // MARK: - Properties
    private var avatars: [[Avatar]] = []
    private let avatarCellText = "AvatarCell"
    private let baseCollectionViewCell = "BaseCollectionViewCell"
    private let avatarHeaderText = "CollectionReusableView"

    // MARK: - Override funcs
    override func setupUI() {
        super.setupUI()
        configCollectionView()
        configNavigationBar()
    }

    override func setupData() {
        super.setupData()
        avatars.append(DummyData.girls)
        avatars.append(DummyData.dsHaiTac)
        avatars.append(DummyData.dsHaiTacMuRom)
        avatars.append(DummyData.girls)
    }

    // MARK: - Private funcs
    private func configCollectionView() {
        collectionView.register(UINib(nibName: avatarCellText, bundle: .main), forCellWithReuseIdentifier: avatarCellText)
        collectionView.register(UINib(nibName: baseCollectionViewCell, bundle: .main), forCellWithReuseIdentifier: baseCollectionViewCell)
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    private func configNavigationBar() {
        title = "Exercise 4"
    }

    // MARK: - @objc private funcs
    @objc private func nextAvatarTouchUpInside() {
        let visibleItems: NSArray = collectionView.indexPathsForVisibleItems as NSArray
        let currentItem: NSIndexPath = visibleItems.object(at: 0) as! NSIndexPath
        let nextItem: NSIndexPath = NSIndexPath(row: currentItem.row + 1, section: 0)
        collectionView.scrollToItem(at: nextItem as IndexPath, at: .left, animated: true)
    }

    @objc private func previousAvatarTouchUpInside() {
        let visibleItems: NSArray = self.collectionView.indexPathsForVisibleItems as NSArray
        let currentItem: NSIndexPath = visibleItems.object(at: 0) as! NSIndexPath
        let nextItem: NSIndexPath = NSIndexPath(row: currentItem.row - 1, section: 0)
        collectionView.scrollToItem(at: nextItem as IndexPath, at: .left, animated: true)
    }
}

// MARK: - Extension: UICollectionViewDataSource
extension ExerciseFourViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return avatars.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let baseCell = collectionView.dequeueReusableCell(withReuseIdentifier: self.baseCollectionViewCell, for: indexPath) as! BaseCollectionViewCell
        baseCell.configData(getAvatars: { return avatars[indexPath.section] }) { return indexPath.section }
        return baseCell
    }
}

// MARK: - Extension: UICollectionViewDelegateFlowLayout
extension ExerciseFourViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            return CGSize(width: collectionView.bounds.width - 50, height: 200)
        default:
            return CGSize(width: collectionView.bounds.width, height: 150)
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
    }
}

// MARK: - Extension: struct DummyData
extension ExerciseFourViewController {
    struct DummyData {
        static var dsHaiTacMuRom: [Avatar] = {
            let avatars = [Avatar(name: "Luffy", nameImage: "luffy"),
                Avatar(name: "Nami", nameImage: "nami"),
                Avatar(name: "Sanji", nameImage: "sanji"),
                Avatar(name: "Usopp", nameImage: "usopp"),
                Avatar(name: "Zoro", nameImage: "zoro"),
                Avatar(name: "Brook", nameImage: "brook"),
                Avatar(name: "Robin", nameImage: "robin"),
                Avatar(name: "Franky", nameImage: "franky"),
                Avatar(name: "Chopper", nameImage: "chopper")
            ]
            return avatars
        }()

        static var dsHaiTac: [Avatar] = {
            let avatars = [Avatar(name: "Luffy", nameImage: "luffy-background"),
                Avatar(name: "Nami", nameImage: "nami-background"),
                Avatar(name: "Sanji", nameImage: "sanji-background"),
                Avatar(name: "Usopp", nameImage: "usopp-background"),
                Avatar(name: "Zoro", nameImage: "zoro-background"),
                Avatar(name: "Brook", nameImage: "brook-background"),
                Avatar(name: "Robin", nameImage: "robin-background")
            ]
            return avatars
        }()

        static var girls: [Avatar] = {
            let avatars = [Avatar(name: "Vietnam", nameImage: "girl-1"),
                Avatar(name: "日本", nameImage: "girl-2"),
                Avatar(name: "中国", nameImage: "girl-3"),
                Avatar(name: "韓国", nameImage: "girl-4"),
                Avatar(name: "Laos", nameImage: "girl-5"),
                Avatar(name: "イギリス", nameImage: "girl-6"),
                Avatar(name: "アメリカ", nameImage: "girl-7")
            ]
            return avatars
        }()
    }
}
