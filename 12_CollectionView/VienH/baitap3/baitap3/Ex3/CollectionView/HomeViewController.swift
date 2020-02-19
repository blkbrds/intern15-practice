//
//  HomeViewController.swift
//  baitap3+4
//
//  Created by user on 12/24/19.
//  Copyright © 2019 VienH. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {

    @IBOutlet private weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavi()
        configCollectionView()
    }

    //MARK: - Private functions
    private func setupNavi() {
        title = "Header"
    }

    private func configCollectionView() {
        collectionView.backgroundColor = #colorLiteral(red: 0.8980392157, green: 0.8745098039, blue: 0.8745098039, alpha: 0.8)

        let cellNib = UINib(nibName: Identifier.customCollectionViewCell, bundle: .main)
        collectionView.register(cellNib, forCellWithReuseIdentifier: Identifier.customCollectionViewCell)
        let headerNib = UINib(nibName: Identifier.teamHeaderCollectionReusableView, bundle: .main)
        collectionView.register(headerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Identifier.teamHeaderCollectionReusableView)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Dummy.numberOfItemsInsection
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return TeamType.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifier.customCollectionViewCell, for: indexPath) as? CustomCollectionViewCell,
            let team = TeamType(rawValue: indexPath.count) else { return UICollectionViewCell() }
        cell.teamMembers = team.members
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let team = TeamType(rawValue: indexPath.section) else { return UICollectionReusableView() }
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Identifier.teamHeaderCollectionReusableView, for: indexPath) as? TeamHeaderCollectionReusableView else { return UICollectionReusableView() }
            header.updateHeaderView(avatar: team.teamAvatar, name: team.teamName)
            return header
        default:
            return UICollectionReusableView()
        }
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return Dummy.sectionInSet
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionVIewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return Dummy.headerReferenceSize
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return Dummy.sizeForItem
    }
}

extension HomeViewController {
    struct Dummy {
        static var sizeForItem: CGSize {
            return CGSize(width: UIScreen.main.bounds.width, height: 150)
        }
        static var headerReferenceSize: CGSize {
            return CGSize(width: UIScreen.main.bounds.width, height: 150)
        }
        static var sectionInSet: UIEdgeInsets {
            return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        }
        static var numberOfItemsInsection: Int = 1
    }

    struct Config {
        static var borderColorImage = UIColor.orange.cgColor
        static var cornerRadiusImage: CGFloat = 40
    }

    struct Identifier {
        static let homeCellCollectionViewCell: String = "HomeCellCollectionViewCell"
        static let customCollectionViewCell: String = "CustomCollectionViewCell"
        static let teamHeaderCollectionReusableView: String = "TeamHeaderCollectionReusableView"
    }
}
