//
//  ViewController.swift
//  BaiTap01
//
//  Created by An Nguyễn on 1/4/20.
//  Copyright © 2020 An Nguyễn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var myCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }

    override func viewDidAppear(_ animated: Bool) {
        setupUI()
    }

    private func setupUI() {
        //Add and Layout CollectionView
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.minimumLineSpacing = 20
        collectionViewLayout.minimumInteritemSpacing = 20
        collectionViewLayout.scrollDirection = .vertical
        let heightCell: CGFloat = 60.0
        let widthCell = (view.bounds.width - CGFloat(2 * 10.0 + 4 * 20.0)) / 5
        collectionViewLayout.itemSize = CGSize(width: widthCell, height: heightCell)
        myCollectionView = UICollectionView(frame: view.bounds, collectionViewLayout: collectionViewLayout)
        myCollectionView.backgroundColor = .white
        myCollectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(myCollectionView)
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": myCollectionView!]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[v0]-10-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": myCollectionView!]))
        myCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "myCell")
        myCollectionView.dataSource = self
    }
}

//MARK: - Collection DataSource
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 60
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath)
        cell.backgroundColor = .red
        let contentView = UIView(frame: cell.bounds)
        let label = UILabel(frame: contentView.bounds)
        label.textAlignment = .center
        label.text = "\(indexPath.row)"
        contentView.addSubview(label)
        cell.backgroundView = contentView
        return cell
    }
}

