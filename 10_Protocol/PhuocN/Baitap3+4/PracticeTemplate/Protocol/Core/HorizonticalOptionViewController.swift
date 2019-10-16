//
//  HorizonticalOptionViewController.swift
//  Protocol
//
//  Created by PhuocNguyen on 10/16/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

class HorizonticalOptionViewController: UIViewController {
    
    var data: [Location] = []
    let spacing: CGFloat = 10
    var color: UIColor = .white

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setupUI() {
        let stackView = UIStackView()
        stackView.center = view.center
        stackView.frame.size = CGSize(width: 200, height: (data.count)*100)
        
    }

}
