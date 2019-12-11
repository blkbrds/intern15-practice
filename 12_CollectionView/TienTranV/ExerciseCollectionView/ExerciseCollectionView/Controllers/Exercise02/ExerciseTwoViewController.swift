//
//  ExerciseTwoViewController.swift
//  ExerciseCollectionView
//
//  Created by PCI0002 on 12/9/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

final class ExerciseTwoViewController: BaseViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var collectionView: UICollectionView!

    // MARK: - Properties
    private var nameCell = "ExerciseTwoCollectionViewCell"
    private let spacing: CGFloat = 10

    // MARK: - Override funcs
    override func setupUI() {
        super.setupUI()
        configNavigationBar()
        configCollectionView()
    }

    // MARK: - Private funcs
    private func configCollectionView() {
        collectionView.register(UINib(nibName: nameCell, bundle: .main), forCellWithReuseIdentifier: nameCell)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func configNavigationBar() {
        title = "Exercise 02"
    }
}

// MARK: - Extention:
extension ExerciseTwoViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: nameCell, for: indexPath) as! ExerciseTwoCollectionViewCell
        return cell
    }
}

extension ExerciseTwoViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let choose = indexPath.item % 3
        let width = (UIScreen.main.bounds.width - 40) / 3
        switch choose {
        case 0:
            return CGSize(width: width, height: 50)
        case 1:
            return CGSize(width: width, height: 50)
        default:
            return CGSize(width: width, height: 200)
        }
    }
}
