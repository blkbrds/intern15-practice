//
//  SliderCollectionCell.swift
//  Bai_Tap_14
//
//  Created by ANH NGUYỄN on 12/9/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import UIKit

protocol SliderCollectionCellDataSource: class {
    func numberOfSectionCollection() -> Int
    func numberRowImage(in section: Int) -> Int
    func imageSlideCollection(in indexPath: IndexPath) -> String
}
final class SliderCollectionCell: UICollectionViewCell {

    @IBOutlet private weak var retireButton: UIButton!
    @IBOutlet private weak var nextButton: UIButton!
    @IBOutlet private weak var collectionView: UICollectionView!

    weak var dataSouce: SliderCollectionCellDataSource?
    var index: Int = 0

    override func awakeFromNib() {
        super.awakeFromNib()
//        configData()
        configCollection()
    }

    @IBAction func nextTouchUpInside(_ sender: Any) {
        guard index < (dataSouce?.numberRowImage(in: index))! - 1 else { return }
        index += 1
        UIView.animate(withDuration: 0.1, animations: {
            self.collectionView.contentOffset = CGPoint(x: CGFloat(self.index) * 1 * self.frame.width, y: 0)
            self.retireButton.setImage(UIImage(named: "retire"), for: .normal)
            self.retireButton.isEnabled = true
        }) { (done) in
            if self.index == 0 {
                self.nextButton.setImage(UIImage(named: "next"), for: .normal)
                self.nextButton.isEnabled = false
            }
        }
    }

    @IBAction func retireTouchUpInside(_ sender: Any) {
        guard index > 0 else { return }
        index -= 1
        UIView.animate(withDuration: 0.1, animations: {
            self.collectionView.contentOffset = CGPoint(x: CGFloat(self.index) * 1 * self.frame.width, y: 0)
            self.nextButton.setImage(UIImage(named: "next"), for: .normal)
            self.nextButton.isEnabled = true
        }) { (done) in
            if self.index == ((self.dataSouce?.numberRowImage(in: self.index))!) - 1 {
                self.retireButton.setImage(UIImage(named: "retire"), for: .normal)
                self.retireButton.isEnabled = false
            }
        }
    }

    func configCollection() {
        let nib = UINib(nibName: "SliderScrollCollectionViewCell", bundle: Bundle.main)
        collectionView.register(nib, forCellWithReuseIdentifier: "SliderScrollCollectionViewCell")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}
extension SliderCollectionCell: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataSouce?.numberOfSectionCollection() ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSouce?.numberRowImage(in: section) ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SliderScrollCollectionViewCell", for: indexPath) as! SliderScrollCollectionViewCell
        let image = dataSouce?.imageSlideCollection(in: indexPath)
        cell.updateCollection(image: image)
        return cell
    }
}

extension SliderCollectionCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = (collectionView.frame.width) - 10
        return CGSize(width: screenWidth, height: 150)
    }
}
