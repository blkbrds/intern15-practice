//
//  SliderCollectionCell.swift
//  BaiTapTongHop
//
//  Created by ANH NGUYỄN on 1/6/20.
//  Copyright © 2020 asiantech. All rights reserved.
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

    weak var dataSource: SliderCollectionCellDataSource?
    var index: Int = 0

    override func awakeFromNib() {
        super.awakeFromNib()
        configCollectionView()
    }

    @IBAction private func nextButtonTouchUpInside(_ sender: Any) {
        guard index < (dataSource?.numberRowImage(in: index))! - 1 else { return }
        index += 1
        collectionView.scrollToItem(at: IndexPath(item: index, section: 0),
                                    at: .right, animated: true)
    }

    @IBAction private func backButtonTouchUpInside(_ sender: Any) {
        guard index > 0 else { return }
        index -= 1
        collectionView.scrollToItem(at: IndexPath(item: index, section: 0),
                                    at: .left, animated: true)
    }

    private func configCollectionView() {
        collectionView.register(name: CellIdentifier.sliderCollectionViewCell.rawValue)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}
extension SliderCollectionCell: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataSource?.numberOfSectionCollection() ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource?.numberRowImage(in: section) ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.sliderScrollCollectionViewCell.rawValue, for: indexPath) as? SliderScrollCollectionViewCell else { return UICollectionViewCell() }
        let image = dataSource?.imageSlideCollection(in: indexPath)
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

