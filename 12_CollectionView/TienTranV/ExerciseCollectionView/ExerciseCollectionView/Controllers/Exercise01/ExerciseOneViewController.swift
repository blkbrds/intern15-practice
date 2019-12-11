//
//  ExerciseOneViewController.swift
//  ExerciseCollectionView
//
//  Created by PCI0002 on 12/9/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

final class ExerciseOneViewController: BaseViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    private var cell = "collectionViewCell"
    
    // MARK: - Override funcs
    override func setupUI() {
        super.setupUI()
        configCollectionView()
        configNavigationBar()
    }
    
    override func setupData() {
        super.setupData()
    }
    
    // MARK: - Private funcs
    private func configCollectionView() {
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cell)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func configNavigationBar() {
        title = "Exercise 01"
    }
}

// MARK: - Extension: UICollectionViewDataSource
extension ExerciseOneViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cell, for: indexPath)
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: cell.bounds.width, height: cell.bounds.height))
        label.text = "\(indexPath.item)"
        label.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        label.textColor = .white
        label.textAlignment = .center
        cell.addSubview(label)
        return cell
    }
}

// MARK: - Extension: UICollectionViewDataSource
extension ExerciseOneViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}
