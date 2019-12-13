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

    var viewModel = SliderDetailViewModel()

    var index: Int = 0

    override func awakeFromNib() {
        super.awakeFromNib()
        updateUI()
        configData()
    }

    func updateUI() {
        configSilder()
    }

    func configData() {
        //load Data
        viewModel.loadData { (done) in
            if done {
                self.updateUI()
            } else {
                //show alertview --> bao' loi~
                let alert = UIAlertController(title: "Error", message: "Khong Lay duoc DaTa", preferredStyle: UIAlertController.Style.alert)
                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                // show the alert
                alert.present(alert, animated: true, completion: nil)
            }
        }
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
            if self.index == self.viewModel.images.count - 1 {
                self.nextButton.setImage(UIImage(named: "next"), for: .normal)
                self.nextButton.isEnabled = false
            }
        }
    }

    @IBAction func nextTuchUpIndide(_ sender: Any) {
        guard index < viewModel.images.count - 1 else { return }
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
        return viewModel.images.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SilderDetailCollectionViewCell", for: indexPath) as! SilderDetailCollectionViewCell
        cell.updateDetail(image: viewModel.images[indexPath.row].imageName)
        return cell
    }
}

extension SliderDetailTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = collectionView.frame.width - 9
        return CGSize(width: screenWidth, height: 120)
    }
}
