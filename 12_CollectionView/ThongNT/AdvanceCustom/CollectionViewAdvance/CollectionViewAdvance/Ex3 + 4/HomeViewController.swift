//
//  HomeViewController.swift
//  CollectionViewAdvance
//
//  Created by PCI0018 on 11/15/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {

    @IBOutlet private weak var collecitonView: UICollectionView!

    private let heroCellNibIndentifier: String = "HeroCollectionViewCell"
    private let customCollectionViewCellIndentifier: String = "CustomCollectionViewCell"
    private let teamCellNibIndentifier: String = "TeamHeaderReusableView"

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavi()
        configCollectionView()
    }

    //MARK: - Private functions
    private func setupNavi() {
        title = "Custom Header"
    }

    private func configCollectionView() {
        collecitonView.backgroundColor = #colorLiteral(red: 0.8980392157, green: 0.8745098039, blue: 0.8745098039, alpha: 0.8)

        let cellNib = UINib(nibName: customCollectionViewCellIndentifier, bundle: .main)
        collecitonView.register(cellNib, forCellWithReuseIdentifier: customCollectionViewCellIndentifier)

        let headerNib = UINib(nibName: teamCellNibIndentifier, bundle: .main)
        collecitonView.register(headerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: teamCellNibIndentifier)
        collecitonView.dataSource = self
        collecitonView.delegate = self
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Team.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: customCollectionViewCellIndentifier, for: indexPath) as? CustomCollectionViewCell,
            let team = Team(rawValue: indexPath.section) else { return UICollectionViewCell() }
        cell.teamMembers = team.members
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let team = Team(rawValue: indexPath.section) else { return UICollectionReusableView() }
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: teamCellNibIndentifier, for: indexPath) as? TeamHeaderReusableView else { return UICollectionReusableView() }
            header.updateHeaderView(avatar: team.teamAvatar, name: team.teamName)
            return header
        default:
            return UICollectionReusableView()
        }
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 306)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 80)
    }
}
