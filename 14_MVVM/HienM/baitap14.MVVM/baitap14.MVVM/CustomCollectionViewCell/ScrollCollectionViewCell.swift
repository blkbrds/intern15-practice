//
//  ScrollCollectionViewCell.swift
//  baitap14.MVVM
//
//  Created by Ngoc Hien on 2/19/20.
//  Copyright © 2020 NgocHien. All rights reserved.
//

import UIKit

class ScrollCollectionViewCell: UICollectionViewCell {

	@IBOutlet weak var pictureCollectionView: UICollectionView!
	var viewModel = ScrollCollectionViewCellModel()
	
	override func awakeFromNib() {
		super.awakeFromNib()
		let layout = UICollectionViewFlowLayout()
		layout.minimumInteritemSpacing = 10
		layout.scrollDirection = .horizontal
		layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 200)
		pictureCollectionView.collectionViewLayout = layout
		pictureCollectionView.isPagingEnabled = true
		loadImageNib()
	}
	
	func loadImageNib() {
		let nib = UINib(nibName: "CollectionViewCell", bundle: .main)
		pictureCollectionView.register(nib, forCellWithReuseIdentifier: "CollectionViewCell")
		pictureCollectionView.delegate = self
		pictureCollectionView.dataSource = self

	}
}

extension ScrollCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 5
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
		cell.viewModel = viewModel.configData1(at: indexPath)
		
		return cell
	}


}


