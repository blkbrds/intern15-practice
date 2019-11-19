//
//  HomeViewController.swift
//  CollectionView
//
//  Created by PCI0018 on 11/14/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {

    @IBOutlet private weak var collectionView: UICollectionView!

    private var rows: [Int] = Array(0...99)
    private let cellIndetifer: String = "MyCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configCollectionView()
    }

    // MARK: - Private functions
    private func setupUI() {
        title = "Collection View"
        let customButton = UIBarButtonItem(title: "Custom", style: .done, target: self, action: #selector(pushToVC))
        navigationItem.rightBarButtonItem = customButton
    }

    private func configCollectionView() {
        collectionView.register(MyCell.self, forCellWithReuseIdentifier: cellIndetifer)
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    // MARK: - Objc functions
    @objc private func pushToVC() {
        navigationController?.pushViewController(Ex2ViewController(), animated: true)
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rows.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIndetifer, for: indexPath) as? MyCell else { return UICollectionViewCell() }
        cell.backgroundColor = #colorLiteral(red: 0, green: 0.5603182912, blue: 0, alpha: 0.8818760702)
        cell.textLabel.text = String(rows[indexPath.row])
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout else { return CGSize(width: 50, height: 50) }
        let numberOfCellsInRow = 5
        let totalSpace = flowLayout.sectionInset.left + flowLayout.sectionInset.right + (flowLayout.minimumInteritemSpacing * CGFloat(numberOfCellsInRow - 1))
        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(numberOfCellsInRow))
        return CGSize(width: size, height: size)
    }
}
