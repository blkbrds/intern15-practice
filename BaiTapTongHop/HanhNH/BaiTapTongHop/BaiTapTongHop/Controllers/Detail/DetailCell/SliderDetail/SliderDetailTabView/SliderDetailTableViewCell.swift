//
//  SliderDetailTableViewCell.swift
//  BaiTapTongHop
//
//  Created by ANH NGUYỄN on 1/6/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

protocol SliderDetailTableViewCellDataSource: class {
    
    func imageSlideCollection(in indexPath: IndexPath) -> String
}
final class SliderDetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!

    var viewModel = SilderDetailViewModel()
    weak var dataSource: SliderDetailTableViewCellDataSource?
    private var index: Int = 0

    override func awakeFromNib() {
        super.awakeFromNib()
        viewModel.getDummyDatasImageSlider()
        updateUI()
    }

    private func updateUI() {
        configSilder()
    }
    
    private func configSilder() {
        collectionView.register(name: CellIdentifier.sliderDetailCollectionViewCell.rawValue)
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    @IBAction func backTouchUpInside(_ sender: Any) {
        guard index > 0 else { return }
        index -= 1
        collectionView.scrollToItem(at: IndexPath(item: index, section: 0),
                                    at: .left, animated: true)
    }

    @IBAction func nextTouchUpInside(_ sender: Any) {
        guard index < viewModel.images.count - 1 else { return }
        index += 1
        collectionView.scrollToItem(at: IndexPath(item: index, section: 0),
                                    at: .right, animated: true)
    }
}

extension SliderDetailTableViewCell {
    struct ConfigSlider {
        static let numberOfSections: Int = 1
        static let paddingHorizontal: Float = 9
        static let heightCcreen: Float = 120
    }
}

extension SliderDetailTableViewCell: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return ConfigSlider.numberOfSections
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.images.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.sliderDetailCollectionViewCell.rawValue, for: indexPath) as? SliderDetailCollectionViewCell else { return UICollectionViewCell() }
        cell.viewModel = viewModel.getSliderDetailCollectionViewModel(atIndexPath: indexPath)
        return cell
    }
}

extension SliderDetailTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = Float(collectionView.frame.width) - ConfigSlider.paddingHorizontal
        return CGSize(width: Int(screenWidth), height: Int(ConfigSlider.heightCcreen))
    }
}
