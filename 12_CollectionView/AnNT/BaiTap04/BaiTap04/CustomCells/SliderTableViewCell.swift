//
//  SliderTableViewCell.swift
//  BaiTap04
//
//  Created by An Nguyễn on 1/4/20.
//  Copyright © 2020 An Nguyễn. All rights reserved.
//

import UIKit

class SliderTableViewCell: UITableViewCell {

    @IBOutlet weak var sliderCollectionView: UICollectionView!
    private var indexCell = 0

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    private func setupUI() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 10
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: self.contentView.bounds.height)
        sliderCollectionView.collectionViewLayout = layout
        sliderCollectionView.isPagingEnabled = true
        loadNib()
        sliderCollectionView.dataSource = self
    }

    private func loadNib() {
        let nib = UINib(nibName: "SliderCollectionViewCell", bundle: .main)
        sliderCollectionView.register(nib, forCellWithReuseIdentifier: "sliderCVCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    @IBAction func backButton(_ sender: Any) {
        indexCell -= 1
        sliderCollectionView.scrollToItem(at: IndexPath(item: indexCell, section: 0), at: .left, animated: true)
        if indexCell <= 0 {
            indexCell = 0
        }
        print(indexCell)
    }

    @IBAction func nextButton(_ sender: Any) {
        indexCell += 1
        sliderCollectionView.scrollToItem(at: IndexPath(item: indexCell, section: 0), at: .right, animated: true)
        if indexCell >= sliderCollectionView.numberOfItems(inSection: 0) - 1 {
            indexCell = sliderCollectionView.numberOfItems(inSection: 0) - 1
        }
        print(indexCell)
    }
}

extension SliderTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sliderCVCell", for: indexPath) as! SliderCollectionViewCell
        cell.backgroundColor = .red
        return cell
    }
}
