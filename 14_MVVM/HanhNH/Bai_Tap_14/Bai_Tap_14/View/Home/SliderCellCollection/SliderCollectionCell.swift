//
//  SliderCollectionCell.swift
//  Bai_Tap_14
//
//  Created by ANH NGUYỄN on 12/9/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import UIKit

class SliderCollectionCell: UICollectionViewCell {

    @IBOutlet weak var retireButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!

    var image: [ImageSlider] = ImageSlider.getGetDummyDatas()
    var index: Int = 0

    override func awakeFromNib() {
        super.awakeFromNib()
        configCollection()
    }
    @IBAction func nextTouchUpInside(_ sender: Any) {
        guard index < image.count - 1 else { return }
        index += 1
        UIView.animate(withDuration: 0.5, animations: {
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
        UIView.animate(withDuration: 0.5, animations: {
            self.collectionView.contentOffset = CGPoint(x: CGFloat(self.index) * 1 * self.frame.width, y: 0)
            self.nextButton.setImage(UIImage(named: "next"), for: .normal)
            self.nextButton.isEnabled = true
        }) { (done) in
            if self.index == self.image.count - 1 {
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
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return image.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SliderScrollCollectionViewCell", for: indexPath) as! SliderScrollCollectionViewCell
        cell.updateCollection(image: image[indexPath.row].imageSlider)
        return cell
    }
}

extension SliderCollectionCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = collectionView.frame.width - 10
        return CGSize(width: screenWidth, height: 150)
    }
}
