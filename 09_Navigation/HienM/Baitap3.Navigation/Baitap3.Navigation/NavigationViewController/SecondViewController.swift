//
//  SecondViewController.swift
//  Baitap3.Navigation
//
//  Created by Ngoc Hien on 2/3/20.
//  Copyright © 2020 NgocHien. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

	@IBOutlet weak var userImage: UIImageView!
	@IBOutlet weak var userNameLabel: UILabel!

	var name: String = ""
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		title = "Profile"
		let rightButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(pop
			))
		navigationItem.rightBarButtonItem = rightButton
		userNameLabel.text = name
	}

	@objc func pop() {
		navigationController?.popViewController(animated: true)
	}
}
