//
//  FirstTableViewCell.swift
//  Baitap04.ColletionView
//
//  Created by Ngoc Hien on 2/12/20.
//  Copyright © 2020 NgocHien. All rights reserved.
//

import UIKit

class FirstTableViewCell: UITableViewCell {

	private var indexCell = 0
	private let marvel: [String] = ["mavel 1", "mavel 2", "mavel 3", "mavel 4", "mavel 5", "mavel 6",]
	private let nameCell: String = "FirstCustomViewCell"

	@IBOutlet weak private var sliderCollectionView: UICollectionView!

	override func awakeFromNib() {
		super.awakeFromNib()
		setupIU()
	}

	private func setupIU () {
		let layout = UICollectionViewFlowLayout()
		layout.minimumInteritemSpacing = 10
		layout.scrollDirection = .horizontal
		layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 40, height: 200)
		sliderCollectionView.collectionViewLayout = layout
		sliderCollectionView.isPagingEnabled = true
		loadNib()
		sliderCollectionView.dataSource = self
	}

	private func loadNib () {
		let nib = UINib(nibName: "FirstCustomViewCell", bundle: .main)
		sliderCollectionView.register(nib, forCellWithReuseIdentifier: nameCell)
	}

	@IBAction private func backButtonTapp(_ sender: Any) {
		indexCell -= 1
		if indexCell < 0 {
			indexCell = marvel.count
		}
		sliderCollectionView.scrollToItem(at: IndexPath(item: indexCell, section: 0), at: .right, animated: true)
	}

	@IBAction func nextButtonTapp(_ sender: Any) {
		indexCell += 1
		sliderCollectionView.scrollToItem(at: IndexPath(item: indexCell, section: 0), at: .left, animated: true)
		if indexCell > marvel.count {
			indexCell = 0
		}
	}
}

extension FirstTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 6
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		//if c
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: nameCell, for: indexPath) as! FirstCustomViewCell
		cell.marvelImage.image = UIImage(named: marvel[indexPath.row])
		return cell
	}
}
