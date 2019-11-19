//
//  MyButtonViewController.swift
//  BaiTapCustomView
//
//  Created by TranVanTien on 11/17/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

final class MyButtonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        let button1 = MyButton()
        button1.frame = CGRect(x: 100, y: 150, width: 150, height: 70)
        button1.isShowBagde = true
        button1.badgeNumber = 0
        button1.backgroundColor = .red
        button1.setTitle("Photos", for: .normal)
        button1.editPositionBagde(position: .topRight)
        view.addSubview(button1)

        let button2 = MyButton()
        button2.frame = CGRect(x: 100, y: 240, width: 150, height: 70)
        button2.isShowBagde = true
        button2.badgeNumber = 20
        button2.backgroundColor = .blue
        button2.setTitle("Camera", for: .normal)
        button2.editPositionBagde(position: .centerRight)
        view.addSubview(button2)

        let button3 = MyButton()
        button3.frame = CGRect(x: 100, y: 320, width: 150, height: 70)
        button3.isShowBagde = true
        button3.badgeNumber = 999
        button3.backgroundColor = #colorLiteral(red: 1, green: 0.1857388616, blue: 0.5733950138, alpha: 0.9177547089)
        button3.setTitle("Icloud", for: .normal)
        button3.editPositionBagde(position: .bottomLeft)
        view.addSubview(button3)
    }
}
