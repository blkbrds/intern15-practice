//
//  SliderTableViewCell.swift
//  BaiTapTongHop
//
//  Created by ANH NGUYỄN on 1/6/20.
//  Copyright © 2020 asiantech. All rights reserved.
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

    var sliderViewModel = SliderViewModel()
    private var index: Int = 0
    weak var dataSource: SliderTableViewDataSoucre?

    override func awakeFromNib() {
        super.awakeFromNib()
        configCollectionView()
    }

    @IBAction private func retireTouchUpInside(_ sender: Any) {
        guard index > 0 else { return }
        index -= 1
        UIView.animate(withDuration: 0.1, animations: {
            self.collectionView.contentOffset = CGPoint(x: CGFloat(self.index) * 1 * self.frame.width, y: 0)
            self.nextButton.setImage(UIImage(named: "next"), for: .normal)
            self.nextButton.isEnabled = true
        }) { [weak self] done in
            guard let this = self else { return }
            if this.index == (this.dataSource?.numberRow(in: this.index))! - 1 {
                this.retireButton.setImage(UIImage(named: "retire"), for: .normal)
                this.retireButton.isEnabled = false
            }
        }
    }

    @IBAction private func nextTouchUpInside(_ sender: Any) {
        guard index < (dataSource?.numberRow(in: index))! - 1 else { return }
        index += 1
        UIView.animate(withDuration: 0.1, animations: {
            self.collectionView.contentOffset = CGPoint(x: CGFloat(self.index) * 1 * self.frame.width, y: 0)
            self.retireButton.setImage(UIImage(named: "retire"), for: .normal)
            self.retireButton.isEnabled = true
        }) { [weak self] done in
            guard let this = self else { return }
            if this.index == 0 {
                this.nextButton.setImage(UIImage(named: "next"), for: .normal)
                this.nextButton.isEnabled = false
            }
        }
    }

    private func configCollectionView() {
        //config Header Collecion
        let nib = UINib(nibName: CellIdentifier.sliderCollectionViewCell.rawValue, bundle: Bundle.main)
        collectionView.register(nib, forCellWithReuseIdentifier: CellIdentifier.sliderCollectionViewCell.rawValue)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}
extension SliderTableViewCell: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataSource?.numberOfSection() ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource?.numberRow(in: section) ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.sliderCollectionViewCell.rawValue, for: indexPath) as? SliderCollectionViewCell  else  { return UICollectionViewCell() }
        let imageSlider = dataSource?.imageSlide(in: indexPath) ?? nil
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

