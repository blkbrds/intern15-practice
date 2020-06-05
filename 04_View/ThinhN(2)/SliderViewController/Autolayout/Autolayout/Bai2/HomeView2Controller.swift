//
//  HomeView2Controller.swift
//  Autolayout
//
//  Created by ADMIN on 6/4/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import UIKit

class HomeView2Controller: UIViewController {
    let subView = Bundle.main.loadNibNamed("SubView", owner: self, options: nil)? [0] as? SubView
    let  a: CGFloat = 50
    override func viewDidLoad() {
        super.viewDidLoad()
//        if let subView = Bundle.main.loadNibNamed("SubView", owner: self, options: nil)? [0] as? SubView {
//            subView.frame = CGRect(x: 10, y: 90, width: 500, height: 200)
//            view.addSubview(subView)
//            subView.setupView()
          addSubView()
        view.addSubview(subView!)
//        }
    }
    
    }
    
}
