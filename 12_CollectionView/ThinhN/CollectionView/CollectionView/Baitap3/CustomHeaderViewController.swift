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
            return "Iphone"
        case.samsung:
            return "SamSung"
        default:
            return "Xiaomi"
        }
    }
    var member: [Member] {
        switch self {
        case .iphone:
            return [Member(name: "iphone 6", avatar: #imageLiteral(resourceName: "download")), Member(name: "iphone 6s", avatar: #imageLiteral(resourceName: "download")), Member(name: "iphone 7", avatar: #imageLiteral(resourceName: "download"))]
        case .samsung:
            return [Member(name: "Note 9", avatar: #imageLiteral(resourceName: "download")), Member(name: "Note 10", avatar: #imageLiteral(resourceName: "download")), Member(name: "S9", avatar: #imageLiteral(resourceName: "download")), Member(name: "S10", avatar: #imageLiteral(resourceName: "download")), Member(name: "S10 +", avatar: #imageLiteral(resourceName: "download"))]
        default:
            return [Member(name: "Mi 8", avatar: #imageLiteral(resourceName: "download")), Member(name: "Mi 9", avatar: #imageLiteral(resourceName: "download")), Member(name: "Mi 10", avatar: #imageLiteral(resourceName: "download"))]
        }
    }
    static var count: Int {
        return Phone.iphone.hashValue + 1
        
    }
    
    
}

class CustomHeaderViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
        
        // Do any additional setup after loading the view.
    }
    func configCollectionView() {
        let cellNib = UINib(nibName: "AvatarCollectionViewCell", bundle: .main)
        collectionView.register(cellNib, forCellWithReuseIdentifier: "cell")
        let headerNib = UINib(nibName: "SectionHeaderCollectionReusableView", bundle: .main)
        collectionView.register(headerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        // collectionView.delegate = self
        collectionView.dataSource = self
    }
    
}
extension CustomHeaderViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Phone.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let phone = Phone(rawValue: section) else {
            fatalError("Phone value is nil")
        }
        return phone.member.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let phone = Phone(rawValue: indexPath.section) else {fatalError("Out of range")}
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! AvatarCollectionViewCell
        cell.imageView.image = phone.member[indexPath.item].avatar
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let phone = Phone(rawValue: indexPath.section)
                else {fatalError("Phone value is nil")}
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header", for: indexPath) as! SectionHeaderCollectionReusableView
            header.nameSectionLabel.text = String(phone.member.count)
            return header
        default:
            return UICollectionReusableView()
        }
    }
    
}
