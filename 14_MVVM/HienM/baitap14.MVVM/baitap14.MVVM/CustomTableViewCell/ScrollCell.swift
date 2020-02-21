//
//  ScrollCell.swift
//  baitap14.MVVM
//
//  Created by Ngoc Hien on 2/19/20.
//  Copyright © 2020 NgocHien. All rights reserved.
//

import UIKit

class ScrollCell: UITableViewCell {

	@IBOutlet weak var scrollColletionView: UICollectionView!
	var viewModel = ScrollCellModel()
	override func awakeFromNib() {
		super.awakeFromNib()
		setupUI()
	}
	func configData() {
		
	}

	func setupUI() {
		let layout = UICollectionViewFlowLayout()
		layout.minimumInteritemSpacing = 10
		layout.scrollDirection = .horizontal
		layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 200)
		scrollColletionView.collectionViewLayout = layout
		scrollColletionView.isPagingEnabled = true
		loadNib()
		scrollColletionView.dataSource = self


	}
	func loadNib() {
		let nib1 = UINib(nibName: "CustomCollectionViewCell", bundle: .main)
		scrollColletionView.register(nib1, forCellWithReuseIdentifier: "CustomCollectionViewCell")
	}
	@IBAction func backButtonTapped(_ sender: Any) {
	}

	@IBAction func nextButtonTapped(_ sender: Any) {
	}
}

extension ScrollCell: UICollectionViewDelegate, UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return viewModel.numberItems()
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as! CustomCollectionViewCell
		cell.viewModel = viewModel.configData1(at: indexPath)
		return cell
	}


}
