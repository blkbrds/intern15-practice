//
//  AlbumImageCell.swift
//  BaiTapTongHop
//
//  Created by ANH NGUYỄN on 1/6/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class AlbumImageCell: UITableViewCell {
    
    @IBOutlet private weak var backButton: UIButton!
    @IBOutlet private weak var nextButton: UIButton!
    @IBOutlet private weak var collectionView: UICollectionView!

    var viewModel = AlbumImageViewModel() {
        didSet {
            collectionView.reloadData()
        }
    }
    private var index: Int = 0

    override func awakeFromNib() {
        super.awakeFromNib()
        configCollectionView()
    }
    
    private func configCollectionView() {
        collectionView.register(name: CellIdentifier.imageCollectionCell.rawValue)
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    @IBAction private func backButtonTouchUpInside(_ sender: Any) {
        guard index > 0 else { return }
        index -= 1
        collectionView.scrollToItem(at: IndexPath(item: index, section: 0),
                                    at: .left, animated: true)
    }

    @IBAction private func nextButtonTouchUpInside(_ sender: Any) {
        guard index < viewModel.numberOfItems() - 1 else { return }
        index += 1
        collectionView.scrollToItem(at: IndexPath(item: index, section: 0),
                                    at: .right, animated: true)
    }
}

extension AlbumImageCell: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.imageCollectionCell.rawValue, for: indexPath) as? ImageCollectionCell else { return UICollectionViewCell() }
        cell.viewModel = viewModel.viewModelForItem(at: indexPath)
        return cell
    }
}

extension AlbumImageCell: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = Float(collectionView.frame.width) - ConfigSlider.paddingHorizontal
        return CGSize(width: Int(screenWidth), height: Int(ConfigSlider.screenHeight))
    }
}

extension AlbumImageCell {
    struct ConfigSlider {
        static let paddingHorizontal: Float = 0
        static let screenHeight: Float = 320
    }
}
