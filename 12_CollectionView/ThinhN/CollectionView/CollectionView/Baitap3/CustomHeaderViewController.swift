//
//  CustomHeaderViewController.swift
//  CollectionView
//
//  Created by PCI0019 on 7/2/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

struct Member {
    let name: String
    let avatar: UIImage
}
enum Phone: Int {
    case iphone
    case samsung
    case xiaomi
    var titleName: String {
        switch self {
        case .iphone:
            return "IPHONE"
        case .samsung:
            return "SAMSUNG"
        case .xiaomi:
            return "XIAOMI"
        }
    }
    var member: [Member] {
        switch self {
        case .iphone:
            return [Member(name: "iphone 6", avatar: #imageLiteral(resourceName: "icons8-iphone-x-40")), Member(name: "iphone 6s", avatar: #imageLiteral(resourceName: "icons8-smartphone-tablet-50")), Member(name: "iphone 7", avatar: #imageLiteral(resourceName: "icons8-apple-logo-50"))]
        case .samsung:
            return [Member(name: "Note 9", avatar: #imageLiteral(resourceName: "samsung-social.png")), Member(name: "Note 10", avatar: #imageLiteral(resourceName: "phone")), Member(name: "S9", avatar: #imageLiteral(resourceName: "calculator")), Member(name: "S10", avatar: #imageLiteral(resourceName: "calculator")), Member(name: "S10 +", avatar: #imageLiteral(resourceName: "samsung-social")), Member(name: "Note 9", avatar: #imageLiteral(resourceName: "samsung-social.png")), Member(name: "Note 10", avatar: #imageLiteral(resourceName: "phone")), Member(name: "S9", avatar: #imageLiteral(resourceName: "calculator")), Member(name: "S10", avatar: #imageLiteral(resourceName: "calculator")), Member(name: "S10 +", avatar: #imageLiteral(resourceName: "samsung-social")), Member(name: "Note 9", avatar: #imageLiteral(resourceName: "samsung-social.png")), Member(name: "Note 10", avatar: #imageLiteral(resourceName: "phone")), Member(name: "S9", avatar: #imageLiteral(resourceName: "calculator")), Member(name: "S10", avatar: #imageLiteral(resourceName: "calculator")), Member(name: "S10 +", avatar: #imageLiteral(resourceName: "samsung-social"))]
        case .xiaomi:
            return [Member(name: "Mi 8", avatar: #imageLiteral(resourceName: "download")), Member(name: "Mi 9", avatar: #imageLiteral(resourceName: "download")), Member(name: "Mi 10", avatar: #imageLiteral(resourceName: "download"))]
        }
    }
}

class CustomHeaderViewController: UIViewController {
    
    var titles: [String] = []
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
    }
    
    func configCollectionView() {
        let cellNib = UINib(nibName: "AvatarCollectionViewCell", bundle: .main)
        collectionView.register(cellNib, forCellWithReuseIdentifier: "cell")
        let headerNib = UINib(nibName: "SectionHeaderCollectionReusableView", bundle: .main)
        collectionView.register(headerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
}
extension CustomHeaderViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let phone = Phone(rawValue: section) else {
            return 0
        }
        return phone.member.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? AvatarCollectionViewCell, let phone = Phone(rawValue: indexPath.section)  else { return UICollectionViewCell() }
        switch phone {
        case .iphone:
            cell.imageView.image = phone.member[indexPath.item].avatar
        case .samsung:
            cell.imageView.image = phone.member[indexPath.item].avatar
        default:
            cell.imageView.image = phone.member[indexPath.item].avatar
        }
        return cell
    }
}

extension CustomHeaderViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let phone = Phone(rawValue: indexPath.section) else { return UICollectionReusableView() }
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header", for: indexPath) as! SectionHeaderCollectionReusableView
        header.sectionTitleLabel.text = phone.titleName
        header.sectionTitleLabel.textColor = .red
        return header
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 30 , height: 50)
    }
}

