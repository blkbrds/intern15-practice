//
//  GokuSuperHeroViewController.swift
//  BaiTap12-collectionView
//
//  Created by ANH NGUYỄN on 11/30/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import UIKit

class GokuSuperHeroViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    var teamMembers: [Team] = Team.teamMembers
    var status: Status = Status.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigation()
        configCollectionView()
    }

    func configCollectionView() {
        let cellNib = UINib(nibName: "GokuHeroCollectionViewCell", bundle: Bundle.main)
        collectionView.register(cellNib, forCellWithReuseIdentifier: "GokuHeroCell")
        let headerNib = UINib(nibName: "TeamHeaderCollectionReusableView", bundle: Bundle.main)
        collectionView.register(headerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderCell")
        collectionView.dataSource = self
    }

    func setUpNavigation() {
        title = "Goku Super Hero"
        turnOnSmallMode()
    }

    @objc private func turnOnStandardMode() {
        changeFlowLayout(status: .standard)
        let smallButton = UIBarButtonItem(title: "Small", style: .plain, target: self,
            action: #selector(turnOnSmallMode))
        navigationItem.rightBarButtonItem = smallButton
    }

    @objc func turnOnSmallMode() {
        changeFlowLayout(status: .small)
        let standardButton = UIBarButtonItem(title: "Standard", style: .plain, target: self,
            action: #selector(turnOnStandardMode))
        navigationItem.rightBarButtonItem = standardButton
    }

    func changeFlowLayout(status: Status) {
        self.status = status
        if let headerViews = self.collectionView.visibleSupplementaryViews(ofKind: UICollectionView.elementKindSectionHeader) as? [TeamHeaderCollectionReusableView] {
            for headerView in headerViews {
                headerView.updateHeader(status: status)
                headerView.setNeedsLayout()
            }
        }
        if let cells = self.collectionView.visibleCells as? [GokuHeroCollectionViewCell] {
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
        collectionView.setCollectionViewLayout(flowLayout, animated: true)
    }
}

extension GokuSuperHeroViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        teamMembers.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teamMembers[section].members.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GokuHeroCell", for: indexPath) as! GokuHeroCollectionViewCell
        let member = teamMembers[indexPath.section].members[indexPath.item]
        cell.updateCell(avatar: member.avatar, name: member.name, status: status)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let team = teamMembers[indexPath.section]
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderCell", for: indexPath) as! TeamHeaderCollectionReusableView
            header.updateHeaderView(avatar: team.teamAvatar, name: team.teamName, status: status)
            return header
        default:
            return UICollectionReusableView()
        }
    }
}

