//
//  AlbumImageCell.swift
//  BaiTapTongHop
//
//  Created by ANH NGUYỄN on 1/6/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

protocol SliderDetailTableViewCellDataSource: class {
    
    func imageSlideCollection(in indexPath: IndexPath) -> String
}

final class AlbumImageCell: UITableViewCell {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!

    var viewModel = AlbumImageViewModel() {
        didSet {
            collectionView.reloadData()
        }
    }
    weak var dataSource: SliderDetailTableViewCellDataSource?
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

    @IBAction func backTouchUpInside(_ sender: Any) {
        guard index > 0 else { return }
        index -= 1
        collectionView.scrollToItem(at: IndexPath(item: index, section: 0),
                                    at: .left, animated: true)
    }

    @IBAction func nextTouchUpInside(_ sender: Any) {
        guard index < viewModel.numberOfItem() - 1 else { return }
        index += 1
        collectionView.scrollToItem(at: IndexPath(item: index, section: 0),
                                    at: .right, animated: true)
    }
}

extension AlbumImageCell: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItem()
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
        return CGSize(width: Int(screenWidth), height: Int(ConfigSlider.heightCcreen))
    }
}

extension AlbumImageCell {
    struct ConfigSlider {
        static let paddingHorizontal: Float = 9
        static let heightCcreen: Float = 120
    }
}
