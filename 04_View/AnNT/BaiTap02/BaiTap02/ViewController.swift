//
//  ViewController.swift
//  BaiTap02
//
//  Created by An Nguyễn on 12/24/19.
//  Copyright © 2019 An Nguyễn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let names = ["An Nguyễn", "Lê Cẩm", "Văn Hào", "Lê Lợi", "Hong Bang", "Van Hau", "Cong Phuong", "Phong Ha", "Quang Thang"]
    let images = Array(repeating: "person", count: 9)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }

    override func viewDidAppear(_ animated: Bool) {
        var x: CGFloat = 10, y: CGFloat = 44
        let width = (UIScreen.main.bounds.width - CGFloat(4 * 10)) / 3
        for i in 1...names.count {
            let userView = UserView(frame: CGRect(x: x, y: y, width: width, height: 170))
            userView.imageUserView?.image = UIImage(systemName: images[i - 1])
            userView.titleLabel?.text = names[i - 1]
            view.addSubview(userView)
            x += width + 10
            if i % 3 == 0 {
                y += 170 + 10
                x = 10
            }
            userView.isUserInteractionEnabled = true
            userView.delegate = self
        }
    }
}

extension ViewController: UserViewDelegate {
    func handleTapDelegate(userView: UserView) {
        print(userView.titleLabel?.text ?? "")
    }
}

