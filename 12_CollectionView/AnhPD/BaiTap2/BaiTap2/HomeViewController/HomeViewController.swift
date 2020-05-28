//
//  HomeViewController.swift
//  BaiTap2
//
//  Created by PCI0012 on 5/28/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {

    @IBOutlet private weak var collectionView: UICollectionView!
    
    private var numbers: [Int] = []
    private var heights: [CGFloat] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let layout = collectionView?.collectionViewLayout as? PinterestLayout {
          layout.delegate = self
        }
        configCollectionView()
        unpdateNumbers()
    }
    
    private func configCollectionView() {
        let nib = UINib(nibName: "HomeCell", bundle: .main)
        collectionView.register(nib, forCellWithReuseIdentifier: "HomeCell")
        collectionView.dataSource = self
    }
    
    private func unpdateNumbers() {
        for index in 1...30 {
            numbers.append(index)
            heights.append(CGFloat.random(in: 10..<300))
        }
    }
}

extension HomeViewController: PinterestLayoutDelegate {
  func collectionView(
      _ collectionView: UICollectionView,
      heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
    return heights[indexPath.item]
  }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numbers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCell
        cell.numberLabel.text = String(numbers[indexPath.row])
        return cell
    }
}
