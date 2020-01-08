//
//  CustomButtonViewController.swift
//  Baittap05-CustomView
//
//  Created by Ngoc Hien on 1/3/20.
//  Copyright © 2020 NgocHien. All rights reserved.
//

import UIKit

class CustomButtonViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		let frameButtom = CGRect(x: 100, y: 130, width: 200, height: 100)
		let buttom = ButtonUIView(frame: frameButtom, positionBadge: .bottomRight)
		buttom.backgroundColor = . white
		view.addSubview(buttom)
	}
}
