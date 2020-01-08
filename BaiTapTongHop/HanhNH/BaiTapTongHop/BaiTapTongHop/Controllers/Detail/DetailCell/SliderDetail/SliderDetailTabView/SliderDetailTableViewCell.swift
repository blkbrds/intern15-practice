//
//  SliderDetailTableViewCell.swift
//  BaiTapTongHop
//
//  Created by ANH NGUYỄN on 1/6/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class SliderDetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var retireButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!

    var viewModel = SliderDetailViewModel()

    private var index: Int = 0

    override func awakeFromNib() {
        super.awakeFromNib()
        updateUI()
        configData()
    }

    private func updateUI() {
        configSilder()
    }

    private func configData() {
        viewModel.loadData { (done) in
            if done {
                updateUI()
            } else {
                let alert = UIAlertController(title: Strings.error, message: Strings.notData, preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: Strings.ok, style: UIAlertAction.Style.default, handler: nil))
                alert.present(alert, animated: true, completion: nil)
                
            }
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    private func configSilder() {
        let nib = UINib(nibName: CellIdentifier.sliderDetailCollectionViewCell.rawValue, bundle: Bundle.main)
        collectionView.register(nib, forCellWithReuseIdentifier: CellIdentifier.sliderDetailCollectionViewCell.rawValue)
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
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.sliderDetailCollectionViewCell.rawValue, for: indexPath) as? SliderDetailCollectionViewCell else { return UICollectionViewCell() }
        cell.updateCollection(image: viewModel.images[indexPath.row].imageName)
        return cell
    }
}

extension SliderDetailTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = collectionView.frame.width - 9
        return CGSize(width: screenWidth, height: 120)
    }
}
