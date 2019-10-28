//
//  HomeViewController.swift
//  CollectionView
//
//  Created by PhuocNguyen on 10/21/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    
    enum CellIdentifier: String {
        case cell = "cell"
        case header = "headerCell"
        case footer = "footerCell"
    }
    
    private var status = Status.standard
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupNavi()
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "HeaderCollectionViewCell", bundle: Bundle.main), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CellIdentifier.header.rawValue)
        collectionView.register(UINib(nibName: "FooterCollectionViewCell", bundle: Bundle.main), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: CellIdentifier.footer.rawValue)
        collectionView.register(UINib(nibName: "HomeCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: CellIdentifier.cell.rawValue)
    }
    
    private func setupNavi() {
        title = "Home"
        turnOnStandardMode()
    }
    
    private func changeFlowLayout(status: Status) {
        self.status = status
        if let headerViews = collectionView.visibleSupplementaryViews(ofKind: UICollectionView.elementKindSectionHeader) as? [HeaderCollectionViewCell] {
            for headerView in headerViews {
                headerView.updateHeaderView(status: status)
                headerView.setNeedsLayout()
            }
        }
        if let cells = collectionView.visibleCells as? [HomeCollectionViewCell] {
            for cell in cells {
                cell.updateCell(status: status)
                cell.setNeedsLayout()
            }
        }
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.itemSize = status.itemSize
        flowLayout.sectionInset = status.sectionInset
        flowLayout.headerReferenceSize = status.headerReferenceSize
        flowLayout.footerReferenceSize = status.footerReferenceSize
        collectionView.setCollectionViewLayout(flowLayout, animated: true)
    }
    
    @objc private func turnOnStandardMode() {
        changeFlowLayout(status: .standard)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Small", style: .plain, target: self, action: #selector(turnOnSmallMode))
    }
    
    @objc private func turnOnSmallMode() {
        changeFlowLayout(status: .small)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Standard", style: .plain, target: self, action: #selector(turnOnStandardMode))
    }
}

extension HomeViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Team.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let team = Team(rawValue: section) else {
            fatalError("Team is nil value")
        }
        return team.members.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let team = Team(rawValue: indexPath.section),
              let item = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.cell.rawValue, for: indexPath) as? HomeCollectionViewCell,
              indexPath.row < team.members.count else {
                fatalError("Fail")
        }
        item.updateCell(status: status, avatar: team.members[indexPath.row].avatar, name: team.members[indexPath.row].name)
        return item
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let team = Team(rawValue: indexPath.section) else {
                fatalError("Team is nil value")
            }
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CellIdentifier.header.rawValue, for: indexPath) as? HeaderCollectionViewCell else {
                return UICollectionReusableView()
            }
            header.update(avatar: team.teamAvatar, name: team.teamName, status: status)
            return header
        case UICollectionView.elementKindSectionFooter:
            guard let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: CellIdentifier.footer.rawValue, for: indexPath) as? FooterCollectionViewCell else {
                return UICollectionReusableView()
            }
            return footer
        default:
            return UICollectionReusableView()
        }
    }
}
