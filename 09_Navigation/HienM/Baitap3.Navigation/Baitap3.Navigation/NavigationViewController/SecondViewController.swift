//
//  SecondViewController.swift
//  Baitap3.Navigation
//
//  Created by Ngoc Hien on 2/3/20.
//  Copyright © 2020 NgocHien. All rights reserved.
//

import UIKit

final class SecondViewController: UIViewController {

	@IBOutlet weak private var userImage: UIImageView!
	@IBOutlet weak private var userNameLabel: UILabel!

	var name: String = ""

	override func viewDidLoad() {
		super.viewDidLoad()

		title = "Profile"
		let rightButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(pop
			))
		navigationItem.rightBarButtonItem = rightButton
		userNameLabel.text = name
	}

	@objc private func pop() {
		navigationController?.popViewController(animated: true)
	}
}
