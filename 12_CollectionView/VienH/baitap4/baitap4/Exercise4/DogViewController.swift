//
//  DogViewController.swift
//  baitap4
//
//  Created by user on 2/11/20.
//  Copyright © 2020 VienH. All rights reserved.
//

import UIKit

final class DogViewController: UIViewController {

    @IBOutlet private weak var collectionView: UICollectionView!

    var status = Status.standard
    let teams: [Team] = [
        Team(type: .alaska),
        Team(type: .poodle),
        Team(type: .pull)
    ]
    private let dogCollectionVIewCell = "DogCollectionViewCell"
    private let teamHeaderReusableVIew = "TeamHeaderReusableView"
    private let teamFooterReusableView = "TeamFooterReusableView"

    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigationBar()
        configCollectionView()
    }

    func configCollectionView() {
        let cellNib = UINib(nibName: dogCollectionVIewCell, bundle: Bundle.main)
        collectionView.register(cellNib, forCellWithReuseIdentifier: dogCollectionVIewCell)

        let headerNib = UINib(nibName: teamHeaderReusableVIew, bundle: Bundle.main)
        collectionView.register(headerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: teamHeaderReusableVIew)

        let footerNib = UINib(nibName: teamFooterReusableView, bundle: Bundle.main)
        collectionView.register(footerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: teamFooterReusableView)
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    func configNavigationBar() {
        title = "Dog"
        turnOnStandardMode()
    }

    @objc func turnOnStandardMode() {
        changeFlowLayout(status: .standard)
        let smallButton = UIBarButtonItem(title: "Small", style: .plain, target: self, action: #selector(turnOnSmallMode))
        navigationItem.rightBarButtonItem = smallButton
    }

    @objc func turnOnSmallMode() {
        changeFlowLayout(status: .small)
        let standardButton = UIBarButtonItem(title: "Standard", style: .plain, target: self, action: #selector(turnOnStandardMode))
        navigationItem.rightBarButtonItem = standardButton
    }

    func changeFlowLayout(status: Status) {
        self.status = status
        collectionView.reloadData()
    }
}

extension DogViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionVIew: UICollectionView) -> Int {
        return teams.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teams[section].members.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let members = teams[indexPath.section].members
        let member = members[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: dogCollectionVIewCell, for: indexPath) as! DogCollectionViewCell
        cell.updateCell(avatar: member.avatar, name: member.name, status: status)
        return cell
    }

    func collectionView(_ colelctionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: teamHeaderReusableVIew, for: indexPath) as! TeamHeaderReusableView
            let team = teams[indexPath.section]
            header.updateHeaderView(avatar: team.teamAvatar, name: team.type.teamName, status: status)
            return header
        case UICollectionView.elementKindSectionFooter:
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: teamFooterReusableView, for: indexPath) as! TeamFooterReusableView
            return footer

        default:
            return UICollectionReusableView()
        }
    }
}

extension DogViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return status.headerReferenceSize
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return status.footerReferceSize
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return status.itemSize
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return status.sectionInset
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.alpha = 0
        cell.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        UIView.animate(withDuration: 0.25) {
            cell.alpha = 1
            cell.transform = .identity
        }
    }
}

extension DogViewController {
    enum Status {
        case standard
        case small

        var itemSize: CGSize {
            switch self {
            case .standard:
                return CGSize(width: UIScreen.main.bounds.width - 20, height: 300)
            case .small:
                return CGSize(width: (UIScreen.main.bounds.width - 30) / 2, height: 170)
            }
        }

        var sectionInset: UIEdgeInsets {
            return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        }

        var sectionOneSize: CGSize {
            return CGSize(width: UIScreen.main.bounds.width - 20, height: 220)
        }

        var headerReferenceSize: CGSize {
            return CGSize(width: 400, height: 80)
        }

        var footerReferceSize: CGSize {
            switch self {
            case .standard:
                return CGSize(width: 400, height: 40)
            case .small:
                return CGSize(width: 400, height: 30)
            }
        }
    }
}
