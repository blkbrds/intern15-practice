//
//  ScrollViewController.swift
//  Autolayout
//
//  Created by PCI0019 on 6/5/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class ScrollViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    func setupView() {
        var x: CGFloat = 0
        var y: CGFloat = 0
        
        let space: CGFloat = 10
        let width: CGFloat = 120
        let heigth: CGFloat = 120
        
        for i in 0...2 {
            x = CGFloat(i) * width + CGFloat(i) * space
            for j in 0...2 {
                y = CGFloat(j) * width + CGFloat(j) * space
                if let avatarView = Bundle.main.loadNibNamed("AvatarView", owner: self, options: nil)? [0] as? AvatarView {
                    avatarView.frame = CGRect(x: x, y: y, width: width , height: heigth)
                    containerView.addSubview(avatarView)
                }
            }
        }
    }
}
