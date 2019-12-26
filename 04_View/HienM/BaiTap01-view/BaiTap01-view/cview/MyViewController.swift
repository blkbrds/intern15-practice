//
//  MyViewcontroller.swift
//  BaiTap01-view
//
//  Created by Ngoc Hien on 12/26/19.
//  Copyright © 2019 NgocHien. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {

	func createMyView(frame: CGRect) {
		let avatarView: UIView = UIView()
		avatarView.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
		avatarView.frame = frame
		let avatarImage: UIImageView = UIImageView()
		avatarImage.image = #imageLiteral(resourceName: "icons8-user-male-150 09-09-50-753")
		avatarImage.frame = CGRect(x: 0, y: 0, width: avatarView.frame.width, height:
				avatarView.frame.height - 30)

		avatarView.addSubview(avatarImage)
		let labelView: UILabel = UILabel()
		labelView.text = "Hello"
		labelView.font = UIFont(name: labelView.font.fontName, size: 20)
		labelView.frame = CGRect(x: 0, y: avatarImage.frame.height + 10, width: avatarImage.frame.width, height: avatarView.frame.height - avatarImage.frame.height - 10)
		labelView.textAlignment = .center
		avatarView.addSubview(labelView)
		view.addSubview(avatarView)
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		var marginTop = 60
		let spacing = 20
		var marginHorizontal = 30
		let widthOfView = 100
		let hightOfView = 150
		for _ in 0..<3 {
			for _ in 0..<3 {
				createMyView(frame: CGRect(x: marginHorizontal, y: marginTop, width: widthOfView, height: hightOfView))
				marginHorizontal = marginHorizontal + spacing + widthOfView
			}
			marginTop = marginTop + hightOfView + 40
			marginHorizontal = 30
		}
	}
}



