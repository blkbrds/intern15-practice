//
//  SliderTableViewCell.swift
//  Bai_Tap_14
//
//  Created by ANH NGUYỄN on 12/9/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import UIKit

protocol SliderTableViewDataSoucre: class {
    func numberOfSection() -> Int
    func numberRow(in section: Int) -> Int
    func imageSlide(in indexPath: IndexPath) -> String
}

final class SliderTableViewCell: UITableViewCell {

    @IBOutlet private weak var nextButton: UIButton!
    @IBOutlet private weak var retireButton: UIButton!
    @IBOutlet private weak var collectionView: UICollectionView!

//    private var images: [UIImage] = []
    var sliderViewModel = SliderViewModel()
    var index: Int = 0
    weak var dataSoucre: SliderTableViewDataSoucre?

    override func awakeFromNib() {
        super.awakeFromNib()
        configCollectionView()
    }

    func configData() {
        //load Data
//        guard let dataSource = dataSoucre else { return }
//        images = dataSource.sliderImages()
//        collectionView.reloadData()
//        sliderViewModel.loadData { (done) in
//            if done {
//                self.updateUI()
//            } else {
//                //show alertview --> bao' loi~
//                let alert = UIAlertController(title: "Error", message: "Khong Lay duoc DaTa", preferredStyle: UIAlertController.Style.alert)
//                // add an action (button)
//                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
//                // show the alert
//                alert.present(alert, animated: true, completion: nil)
//            }
//        }
    }

    @IBAction private func retireTouchUpInside(_ sender: Any) {
        guard index > 0 else { return }
        index -= 1
        UIView.animate(withDuration: 0.5, animations: {
            self.collectionView.contentOffset = CGPoint(x: CGFloat(self.index) * 1 * self.frame.width, y: 0)
            self.nextButton.setImage(UIImage(named: "next"), for: .normal)
            self.nextButton.isEnabled = true
        }) { done in
            if self.index == (self.dataSoucre?.numberRow(in: self.index))! - 1 {
                self.retireButton.setImage(UIImage(named: "retire"), for: .normal)
                self.retireButton.isEnabled = false
            }
        }
    }

    @IBAction private func nextTouchUpInside(_ sender: Any) {
        guard index < (dataSoucre?.numberRow(in: index))! - 1 else { return }
        index += 1
        UIView.animate(withDuration: 0.5, animations: {
            self.collectionView.contentOffset = CGPoint(x: CGFloat(self.index) * 1 * self.frame.width, y: 0)
            self.retireButton.setImage(UIImage(named: "retire"), for: .normal)
            self.retireButton.isEnabled = true
        }) { done in
            if self.index == 0 {
                self.nextButton.setImage(UIImage(named: "next"), for: .normal)
                self.nextButton.isEnabled = false
            }
        }
    }

    func configCollectionView() {
        //config Header Collecion
        let nib = UINib(nibName: "SliderCollectionViewCell", bundle: Bundle.main)
        collectionView.register(nib, forCellWithReuseIdentifier: "SliderCollectionViewCell")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}
extension SliderTableViewCell: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataSoucre?.numberOfSection() ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSoucre?.numberRow(in: section) ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SliderCollectionViewCell", for: indexPath) as! SliderCollectionViewCell
        
        let imageSlider = dataSoucre?.imageSlide(in: indexPath) ?? nil
        cell.updateSliderView(image: imageSlider)
        
        return cell
    }
}

extension SliderTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = collectionView.frame.width - 10
        return CGSize(width: screenWidth, height: 150)
    }
}
