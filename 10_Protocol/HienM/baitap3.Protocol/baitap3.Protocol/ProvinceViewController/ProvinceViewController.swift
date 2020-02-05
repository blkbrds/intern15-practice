//
//  ProvinceViewController.swift
//  baitap3.Protocol
//
//  Created by Ngoc Hien on 2/4/20.
//  Copyright © 2020 NgocHien. All rights reserved.
//

import UIKit

class ProvinceViewController: UIViewController {

	@IBOutlet var TinhButton: [UIButton]!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Province"

		let rightButton = UIBarButtonItem(title: "District", style: .plain, target: self, action: #selector(pushToDistrictViewController))
		navigationItem.rightBarButtonItem = rightButton
		
		let backButton = UIBarButtonItem(image: UIImage(named: "back arrow"), style: .plain, target: self, action: #selector(backtoViewLocalViewController))
		navigationItem.leftBarButtonItem = backButton
	}
	@objc func pushToDistrictViewController() {
		let vc = DistrictViewController()
		navigationController?.pushViewController(vc, animated: true)
	}
	
	@objc func backtoViewLocalViewController() {
		navigationController?.popViewController(animated: true)
	}
}
