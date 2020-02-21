//
//  HomeViewController.swift
//  BaiTap03
//
//  Created by An Nguyễn on 1/4/20.
//  Copyright © 2020 An Nguyễn. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet private weak var myCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func loadNib() {
        let headerNib = UINib(nibName: "SectionCollectionReusableView", bundle: .main)
        myCollectionView.register(headerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerView")
        let nib = UINib(nibName: "MyCollectionViewCell", bundle: .main)
        myCollectionView.register(nib, forCellWithReuseIdentifier: "myCell")
    }

    private func setupUI() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 20
        layout.minimumLineSpacing = 10
        layout.headerReferenceSize = CGSize(width: myCollectionView.bounds.width, height: 40)
        myCollectionView.collectionViewLayout = layout
        loadNib()
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func indexTitles(for collectionView: UICollectionView) -> [String]? {
        return ["A", "B", "C"]
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let reusableview = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerView", for: indexPath) as! SectionCollectionReusableView
            reusableview.textLabel.text = "section \(indexPath.section)"
            reusableview.backgroundColor = .red
            return reusableview
        default:
            fatalError("Unexpected element kind")
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! MyCollectionViewCell
        cell.backgroundColor = .cyan
        return cell
    }
}
