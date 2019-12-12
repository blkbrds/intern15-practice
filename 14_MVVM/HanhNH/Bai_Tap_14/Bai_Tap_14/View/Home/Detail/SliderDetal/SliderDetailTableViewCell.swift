//
//  SliderDetailTableViewCell.swift
//  Bai_Tap_14
//
//  Created by ANH NGUYỄN on 12/11/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import UIKit

class SliderDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var retireButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!

    var images: [ImageSlider] = ImageSlider.getGetDummyDatas()
    var index: Int = 0

    override func awakeFromNib() {
        super.awakeFromNib()
        configSilder()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configSilder() {
        let nib = UINib(nibName: "SilderDetailCollectionViewCell", bundle: Bundle.main)
        collectionView.register(nib, forCellWithReuseIdentifier: "SilderDetailCollectionViewCell")
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    @IBAction func retireTuchUpInsilde(_ sender: Any) {
        guard index > 0 else { return }
        index -= 1
        UIView.animate(withDuration: 0.5, animations: {
            self.collectionView.contentOffset = CGPoint(x: CGFloat(self.index) * 1 * self.frame.width, y: 0)
            self.retireButton.setImage(UIImage(named: "retire"), for: .normal)
            self.retireButton.isEnabled = true
        }) { (done) in
            if self.index == self.images.count - 1 {
                self.nextButton.setImage(UIImage(named: "next"), for: .normal)
                self.nextButton.isEnabled = false
            }
        }
    }

    @IBAction func nextTuchUpIndide(_ sender: Any) {
        guard index < images.count - 1 else { return }
        index += 1
        UIView.animate(withDuration: 0.5, animations: {
            self.collectionView.contentOffset = CGPoint(x: CGFloat(self.index) * 1 * self.frame.width, y: 0)
            self.nextButton.setImage(UIImage(named: "next"), for: .normal)
            self.nextButton.isEnabled = true
        }) { (done) in
            if self.index == 0 {
                self.retireButton.setImage(UIImage(named: "retire"), for: .normal)
                self.retireButton.isEnabled = false
            }
        }
    }
}
extension SliderDetailTableViewCell: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SilderDetailCollectionViewCell", for: indexPath) as! SilderDetailCollectionViewCell
        cell.updateDetail(image: images[indexPath.row].imageSlider)
        return cell
    }
}

extension SliderDetailTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = collectionView.frame.width - 10
        return CGSize(width: screenWidth, height: 120)
    }
}
