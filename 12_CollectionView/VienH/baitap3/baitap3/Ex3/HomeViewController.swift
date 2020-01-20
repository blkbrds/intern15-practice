//
//  HomeViewController.swift
//  baitap3+4
//
//  Created by user on 12/24/19.
//  Copyright © 2019 VienH. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    private let homeCellCollectionViewCell: String = "HomeCellCollectionViewCell"
    private let customCollectionViewCellIndentifier: String = "CustomCollectionViewCell"
    private let teamCellNibIndentifier: String = "TeamHeaderCollectionReusableView"

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

        let cellNib = UINib(nibName: customCollectionViewCellIndentifier, bundle: .main)
        collectionView.register(cellNib, forCellWithReuseIdentifier: customCollectionViewCellIndentifier)

        let headerNib = UINib(nibName: teamCellNibIndentifier, bundle: .main)
        collectionView.register(headerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: teamCellNibIndentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
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
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: teamCellNibIndentifier, for: indexPath) as? TeamHeaderCollectionReusableView else { return UICollectionReusableView() }
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
