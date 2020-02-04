//
//  HomeViewController.swift
//  baitap02.Protocol
//
//  Created by Ngoc Hien on 2/4/20.
//  Copyright © 2020 NgocHien. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

	@IBOutlet private weak var scrollView: UIScrollView!

	var namesml: String = ""
	var ms: [AvatarView] = []
	private let names: [String] = ["name 1", "name 2", "name 3", "name 4", "name 5", "name 6", "name 7", "name 8", "name 9", "name 10", "name 11", "name 12", "name 13", "name 14", "name 15", "name 16", "name 17", "name 18", "name 19", "name 20", "name 21", "name 22", "name 23", "name 24", "name 25", "name 26", "name 27", "name 28", "name 29", "name 30", "name 31", "name 32", "name 33",]


	override func viewDidLoad() {
		super.viewDidLoad()

		title = "Home"
		scrollView.contentSize = CGSize(width: view.bounds.width, height: 2000)
		view.addSubview(scrollView)

		setupUI()


	}

	func setupUI() {
		let widthView: CGFloat = 100
		let hightView: CGFloat = 170
		let spacing: CGFloat = 25
		var spacingtoScrollView: CGFloat = 35
		var spacingHorizotal: CGFloat = 20
		let x = scrollView.bounds.width

		for i in 100..<100 + names.count {

			let userView = Bundle.main.loadNibNamed("AvatarView", owner: self, options: nil)?.first as? AvatarView

			guard let userView1 = userView else { return }

			let frame = CGRect(x: spacingtoScrollView, y: spacingHorizotal, width: widthView, height: hightView)
			userView1.frame = frame
			userView1.tag = i

			spacingtoScrollView += widthView + spacing
			if spacingtoScrollView + 50 > x {
				spacingtoScrollView = 35
				spacingHorizotal += hightView + 20
			}
			userView1.delegate = self

			scrollView.addSubview(userView1)
			userView1.nameLabel.text = names[i]

		}
	}
}

extension HomeViewController: UserViewDeligate {
	func view(view: AvatarView, needPerformAction action: AvatarView.Action) {
		print("")
	}
}

extension HomeViewController: ProfileViewControllerDelegate {

	func controller(controller: ProfileViewController, needPerformAction action: ProfileViewController.Action) {
		switch action {
		case .updateName(let nameUser): break
		
		}
	}
}


