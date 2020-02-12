//
//  DogViewController.swift
//  baitap4
//
//  Created by user on 2/11/20.
//  Copyright © 2020 VienH. All rights reserved.
//

import UIKit


class DogViewController: UIViewController {
    
    enum Status {
        case standard
        case small

        var itemSize: CGSize {
            switch self {
            case .standard:
                return CGSize(width: 150, height: 180)
            default:
                return CGSize(width: 80, height: 80)
            }
        }

        var sectionInset: UIEdgeInsets {
            switch self {
            case .standard:
                return UIEdgeInsets(top: 20, left: 40, bottom: 20, right: 40)
            default:
                return UIEdgeInsets(top: 30, left: 10, bottom: 10, right: 10)
            }
        }

        var headerReferenceSize: CGSize {
            switch self {
            case .standard:
                return CGSize(width: 400, height: 80)
            default:
                return CGSize(width: 400, height: 40)
            }
        }

        var footerReferceSize: CGSize {
            switch self {
            case .standard:
                return CGSize(width: 400, height: 40)
            default:
                return CGSize(width: 400, height: 30)
            }
        }
    }

    var status = Status.standard

    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigationBar()
        configCollectionView()
    }

    func configCollectionView() {
        let cellNib = UINib(nibName: "DogCollectionViewCell", bundle: Bundle.main)
        collectionView.register(cellNib, forCellWithReuseIdentifier: "DogCollectionViewCell")

        let headerNib = UINib(nibName: "TeamHeaderReusableView", bundle: Bundle.main)
        collectionView.register(headerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "TeamHeaderReusableView")

        let footerNib = UINib(nibName: "TeamFooterReusableView", bundle: Bundle.main)
        collectionView.register(footerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "TeamFooterReusableView")
        collectionView.dataSource = self
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
        if let headerViews = self.collectionView.visibleSupplementaryViews(ofKind: UICollectionView.elementKindSectionHeader) as? [TeamHeaderReusableView] {
            for headerView in headerViews {
                headerView.updateHeaderViews(status: status)
            }
        }

        if let cells = self.collectionView.visibleCells as? [DogCollectionViewCell] {
            for cell in cells {
                cell.updateCell(status: status)
                cell.setNeedsLayout()
            }
        }
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.sectionInset = status.sectionInset
        flowLayout.headerReferenceSize = status.headerReferenceSize
        flowLayout.footerReferenceSize = status.footerReferceSize
        collectionView.setCollectionViewLayout(flowLayout, animated: true)
    }
}

extension DogViewController: UICollectionViewDataSource {
 
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Team.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let team = Team(rawValue: section)
            else {fatalError("Team value is nil") }
        return team.members.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let team = Team(rawValue: indexPath.section)
            else { fatalError("Member value is nil" ) }
        
        guard let indexPath.item < team.members.count
            else { fatalError("Member index is out of bounds") }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DogCollectionViewCell", for: indexPath) as! DogCollectionViewCell
        cell.updateCell(avatar: team.members[indexPath.item].avatar, name: team.members[indexPath.item].name)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let team = Team(rawValue: indexPath.section)
                else { fatalError("Team value is nil") }
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "TeamHeaderReusableView", for: indexPath) as! TeamHeaderReusableView
            header.updateHeaderView(avatar: team.teamAvatar, name: team.teamName)
            return header
        
        case UICollectionView.elementKindSectionFooter:
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "TeamFooterReusableView", for: indexPath) as! TeamFooterReusableView
            return footer
            
        default :
            return UICollectionReusableView()
        }
    }
}
