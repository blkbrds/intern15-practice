//
//  HomeViewController.swift
//  MVVM
//
//  Created by Ngoc Hien on 2/20/20.
//  Copyright © 2020 NgocHien. All rights reserved.
//

import UIKit

final class HomeViewController: BaseViewController {

	var viewModel = HomeViewModel()
	private var tapping: Bool = true

	@IBOutlet private weak var coffeeCollectionView: CoffeeCollectionView!
	@IBOutlet private weak var collectionView: UICollectionView!
	@IBOutlet weak var tableView: UITableView!

	override func viewDidLoad() {
		super.viewDidLoad()
		loadNib()
		setupNaviBar()
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
		coffeeCollectionView.dataSource = self
		coffeeCollectionView.loadNibString(str: "CoffeeCollectionViewCell")
		coffeeCollectionView.delegate = self
	}

	private func setupNaviBar() {
		title = "Home"
		let rightButton = UIBarButtonItem(image: UIImage(named: "grib"), style: .plain, target: self, action: #selector(changeStypeCollectionCoffee))
		navigationItem.rightBarButtonItem = rightButton
	}

	@objc private func changeStypeCollectionCoffee () {
		if tapping {
			collectionView.isHidden = false
			tableView.isHidden = true
			tapping = false
		} else {
			collectionView.isHidden = true
			tableView.isHidden = false
			tapping = true
		}
	}
}

extension HomeViewController: UICollectionViewDataSource {

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return viewModel.getNumberObject()
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		switch collectionView {
		case coffeeCollectionView:
			let cell = coffeeCollectionView.dequeueReusableCell(withReuseIdentifier: "CoffeeCollectionViewCell", for: indexPath) as! CoffeeCollectionViewCell
			cell.viewModel = viewModel.getDataCoffeeView(at: indexPath)
			return cell
		case collectionView:
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FirstCollectionViewCell", for: indexPath) as! FirstCollectionViewCell
			cell.viewModel = viewModel.getDataFirstView(at: indexPath)

			return cell
		default:
			return UICollectionViewCell()
		}
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
	
	func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
			viewModel.slidesImage.remove(at: indexPath.row)
			tableView.beginUpdates()
			tableView.deleteRows(at: [indexPath], with: .fade)
			tableView.endUpdates()
		}

	}
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return viewModel.getNumberObject()
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "SecondTableViewCell") as! SecondTableViewCell
		cell.viewModel = viewModel.getDataSecondCell(at: indexPath)
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return CGFloat(UIScreen.main.bounds.height / 8)
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let detailVC = DetailViewController()
		navigationController?.pushViewController(detailVC, animated: true)
	}
}

