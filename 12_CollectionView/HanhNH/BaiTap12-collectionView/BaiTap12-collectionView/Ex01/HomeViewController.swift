//
//  HomeViewController.swift
//  BaiTap12-collectionView
//
//  Created by ANH NGUYỄN on 11/28/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()

    }

    func setUpUI() {
        let nib = UINib(nibName: "HomeCollectionViewCell", bundle: Bundle.main)
        collectionView.register(nib, forCellWithReuseIdentifier: "HomeCollectionViewCell")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}
extension HomeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        cell.viewLabel.text = "\(indexPath.item + 1)"
        cell.backgroundColor = .brown
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 50)
    }
}

