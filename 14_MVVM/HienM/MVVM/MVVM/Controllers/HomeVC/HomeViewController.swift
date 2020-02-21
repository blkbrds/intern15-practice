//
//  HomeViewController.swift
//  MVVM
//
//  Created by Ngoc Hien on 2/20/20.
//  Copyright © 2020 NgocHien. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

	var viewModel = HomeViewModel()
//	enum Type {
//		case tableVewCell
//		case collectionViewCell
//
//	}

	@IBOutlet weak var changeDisplay: UIBarButtonItem!
	@IBOutlet weak var pageControl: UIPageControl!
	@IBOutlet weak var scrollView: UIScrollView!
	@IBOutlet weak var collectionView: UICollectionView!

	override func viewDidLoad() {
		super.viewDidLoad()
		loadNib()

	}

	override func setupData() {
	}
	func loadNib() {
		let firstNib = UINib(nibName: "SecondCollectionCell", bundle: .main)
		collectionView.register(firstNib, forCellWithReuseIdentifier: "SecondCollectionCell")
		collectionView.dataSource = self
		collectionView.delegate = self
	}

}
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return viewModel.getNumberObject()
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SecondCollectionCell", for: indexPath) as! SecondCollectionCell
		return cell
	}
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: UIScreen.main.bounds.width - 10, height: UIScreen.main.bounds.height / 7 )
	}
}
