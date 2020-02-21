//
//  HomeViewController.swift
//  baitap14.MVVM
//
//  Created by Ngoc Hien on 2/18/20.
//  Copyright © 2020 NgocHien. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

	var tapping = 1


	@IBOutlet weak var changeButton: UIButton!


	@IBOutlet weak var myCollectionView: UICollectionView!
	@IBOutlet weak var myTableView: UITableView!
	var homeViewModel = HomeViewModel()
	override func viewDidLoad() {
		super.viewDidLoad()
		loadTableCellNib()
		loadCollectionView()
		myCollectionView.delegate = self
		myCollectionView.dataSource = self
		changeButton.imageView?.image = UIImage(named: "grib")

	}
	func loadTableCellNib() {
		let nib1 = UINib(nibName: "ScrollCell", bundle: .main)
		let nib2 = UINib(nibName: "HomeTableViewCell", bundle: .main)

		myTableView.register(nib1, forCellReuseIdentifier: "ScrollCell")
		myTableView.register(nib2, forCellReuseIdentifier: "HomeTableViewCell")

	}


	func loadCollectionView() {
		let nib3 = UINib(nibName: "ScrollCollectionViewCell", bundle: .main)
		let nib2 = UINib(nibName: "SecondCollectionViewCell", bundle: .main)

		myCollectionView.register(nib3, forCellWithReuseIdentifier: "ScrollCollectionViewCell")
		myCollectionView.register(nib2, forCellWithReuseIdentifier: "SecondCollectionViewCell")
	}

	@IBAction func changeScreenTapped(_ sender: UIButton) {
		if tapping % 2 != 0 {
			changeButton.setImage(UIImage(named: "list"), for: .normal)
			myCollectionView.isHidden = false
			myTableView.isHidden = true
			tapping -= 1
		} else {
			changeButton.setImage(UIImage(named: "grib"), for: .normal)
			myCollectionView.isHidden = true
			myTableView.isHidden = false
			tapping += 1
		}
	}

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return homeViewModel.numberItems()
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if indexPath.row == 0 {
			guard let cell = myTableView.dequeueReusableCell(withIdentifier: "ScrollCell") else {
				let cell = UITableViewCell(style: .default, reuseIdentifier: "ScrollCell")
				return cell

			}
			return cell
		} else {
			guard let cell = myTableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell") as? HomeTableViewCell else { return UITableViewCell() }
			cell.viewModel = homeViewModel.configData2(at: indexPath)
			return cell
		}
	}

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		if indexPath.row == 0 {
			return 200
		} else {
			return 100
		}
	}
	func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
		return true
	}
	func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
			myTableView.deleteRows(at: [indexPath], with: .bottom)
		}
	}

}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		if section == 0 {
			return 1
		} else {
			return homeViewModel.numberItems()
		}
	}
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 2
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		if indexPath.section == 0 {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ScrollCollectionViewCell", for: indexPath) as! ScrollCollectionViewCell
			
			return cell
		} else {
			guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SecondCollectionViewCell", for: indexPath) as? SecondCollectionViewCell else {
				return UICollectionViewCell()
			}
			cell.viewModel = homeViewModel.configData1(at: indexPath)
			return cell
		}
	}
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		if indexPath.section == 0 {
			return CGSize(width: UIScreen.main.bounds.width, height: 205)
		} else {
			return CGSize(width: UIScreen.main.bounds.width / 2 - 10, height: UIScreen.main.bounds.height / 3 - 40)
		}
	}

}
