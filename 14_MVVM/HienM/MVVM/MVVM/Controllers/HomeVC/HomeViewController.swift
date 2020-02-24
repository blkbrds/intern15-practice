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
	private var tapping: Bool = true

	@IBOutlet weak var changeScreenBtn: UIButton!
	@IBOutlet weak var collectionView: UICollectionView!
	

	@IBOutlet weak var tableView: UITableView!
	override func viewDidLoad() {
		super.viewDidLoad()
		loadNib()
	
	}
	private func loadNib() {

		let firstNib = UINib(nibName: "FirstCollectionViewCell", bundle: .main)
		let secondNib = UINib(nibName: "SecondTableViewCell", bundle: .main)
		collectionView.register(firstNib, forCellWithReuseIdentifier: "FirstCollectionViewCell")
		tableView.register(secondNib, forCellReuseIdentifier: "SecondTableViewCell")
		tableView.delegate = self
		tableView.dataSource = self
		collectionView.dataSource = self
		collectionView.delegate = self
		collectionView.isHidden = true
	}

}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return viewModel.getNumberObject()
	}
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FirstCollectionViewCell", for: indexPath) as! FirstCollectionViewCell
		cell.viewModel = viewModel.cofigData2(at: indexPath)
		return cell
	}
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: UIScreen.main.bounds.width / 2 - 20, height: UIScreen.main.bounds.height / 3)
	}

	func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
		cell.alpha = 0
		cell.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
		UIView.animate(withDuration: 0.4) {
			cell.alpha = 1
			cell.transform = .identity
		}
	}
}
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return viewModel.getNumberObject()
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "SecondTableViewCell") as! SecondTableViewCell
		cell.viewModel = viewModel.configData1(at: indexPath)
		return cell
	}
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return CGFloat(UIScreen.main.bounds.height / 8)
	}


}
