//
//  HomeViewController.swift
//  BaiTap3
//
//  Created by PCI0012 on 5/27/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {

    @IBOutlet private weak var collectionView: UICollectionView!
    
    var numbers: [[Int]] = [[1,2,3,4,5,6], [5,6,7,8,9,10], [9,6,4,2,5,7],[1,2,4,6,7,4]]
    var sections: [String] = []
    var namesFooter: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateSections()
        updateNamesFooter()
        configCollectionView()
    }
    
    private func configCollectionView() {
        let nib = UINib(nibName: "HomeCell", bundle: .main)
        collectionView.register(nib, forCellWithReuseIdentifier: "HomeCell")
        
        let header = UINib(nibName: "HomeHeaderView", bundle: .main)
        collectionView.register(header, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HomeHeaderView")
        
        let footer = UINib(nibName: "HomeFooterView", bundle: .main)
        collectionView.register(footer, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "HomeFooterView")
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func updateSections() {
        for item in 0..<numbers.count {
            sections.append("Sections \(String(item + 1))")
        }
    }
    
    private func updateNamesFooter() {
        for item in 0..<numbers.count {
            namesFooter.append("End \(String(item + 1))")
        }
    }
}

extension HomeViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numbers[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as? HomeCell ?? HomeCell()
        cell.numberLabel.text = String(numbers[indexPath.section][indexPath.row])
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width / 4, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 25)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        print(indexPath)
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HomeHeaderView", for: indexPath) as? HomeHeaderView ?? HomeHeaderView()
            header.nameTitleLabel.text = sections[indexPath.section]
            return header
        case UICollectionView.elementKindSectionFooter:
            
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "HomeFooterView", for: indexPath) as? HomeFooterView ?? HomeFooterView()
            footer.nameFooterLabel.text = namesFooter[indexPath.section]
            return footer
        default:
            return UICollectionReusableView()
        }
    }
}
