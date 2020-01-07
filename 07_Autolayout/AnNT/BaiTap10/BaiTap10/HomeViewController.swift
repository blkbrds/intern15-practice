//
//  HomeViewController.swift
//  BaiTap10
//
//  Created by An Nguyễn on 12/30/19.
//  Copyright © 2019 An Nguyễn. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var bigView: UIView!
    @IBOutlet var smallView: [UIView]!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func handleTapSmallView1(_ sender: Any) {
        scaleView()
    }
    
    @IBAction func handleTapSmallView2(_ sender: Any) {
        scaleView()
    }
    
    @IBAction func handleTapSmallView3(_ sender: Any) {
        scaleView()
    }

    private func scaleView() {
        UIView.animate(withDuration: 1) {
            self.smallView.forEach({
                $0.transform = CGAffineTransform.init(scaleX: 0.5, y: 0.5)
            })
            self.bigView.transform = CGAffineTransform.init(scaleX: 2, y: 2)
        }
    }
}
