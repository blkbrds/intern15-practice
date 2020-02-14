//
//  Ex1ViewController.swift
//  baitap12
//
//  Created by user on 12/24/19.
//  Copyright © 2019 VienH. All rights reserved.
//

import UIKit

final class Ex1ViewController: UIViewController {

    struct Dummy {
        static let rows: [Int] = Array(0...99)
    }

    @IBOutlet private weak var collectionView: UICollectionView!
    private var homeCell: String = "HomeCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        collectionView.register(HomeCell.self, forCellWithReuseIdentifier: homeCell)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension Ex1ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Dummy.rows.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: homeCell, for: indexPath) as? HomeCell else { return UICollectionViewCell() }
        cell.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        cell.textLabel.text = String(Dummy.rows[indexPath.row])
        return cell
    }
}
