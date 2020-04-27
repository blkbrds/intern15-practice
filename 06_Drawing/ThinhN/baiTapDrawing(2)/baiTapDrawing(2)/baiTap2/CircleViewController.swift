//
//  CircleViewController.swift
//  baiTapDrawing(2)
//
//  Created by ADMIN on 4/26/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import UIKit

final class CircleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let circleView = CircleView(frame: CGRect(x: 100, y: 300, width: 200, height: 200))
        circleView.backgroundColor = . white
        circleView.values = [20, 40, 50, 80]
        view.backgroundColor = .white
        view.addSubview(circleView)
    }
}
