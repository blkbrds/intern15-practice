//
//  myViewController.swift
//  NoStoryboard
//
//  Created by Ngoc Hien on 12/18/19.
//  Copyright © 2019 NgocHien. All rights reserved.
//

import UIKit

class myViewController: UIViewController {

	@IBOutlet weak var MyBotton: UIButton!
	var colors: [UIColor] = [.red, .black, .blue, .brown]
	var count: Int = 0
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

	@IBAction func MyBotton(_ sender: Any) {
		let temp = count % 4 // 0, 1, 2, 3
		self.view.backgroundColor = colors[temp]
		count += 1
	}
	
 
}
