//
//  HomeViewController.swift
//  Baitap01
//
//  Created by PCI0008 on 12/18/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    let userNames: [String] = ["Messi", "Ronaldo", "Neymar", "Hazard", "Mbappe", "Dybala", "Suarez", "Frenkie", "Xavi", "Iniesta", "Busquets", "Villa", "Pedro", "Sanchez", "Ronaldinho", "Eto'o", "Abidal", "Alba", "Puyol", "Pique", "Mascherano", "Canavaro", "Cafu", "Maldini", "Casilass", "Stegen", "De Gea", "Kahn", "Neuer", "Buffon"]
    var avatarViews: [MyAvatar] = []
    var x: Double = 28.5
    var y: Double = 20
    var index: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: 1400)
        setUpUI()
    }
    
    func setUpUI() {
        for _ in 0...9 {
            for _ in 0...2 {
                if let avatarView = Bundle.main.loadNibNamed("MyAvatar", owner: self, options: nil)?[0] as? MyAvatar {
                    avatarViews.append(avatarView)
                    avatarView.frame = CGRect(x: x, y: y, width: 100, height: 120)
                    avatarView.userNameLabel.text = userNames[index]
                    avatarView.userNameLabel.textColor = .red
                    avatarView.delegate = self
                    scrollView.addSubview(avatarView)
                    x += 128.5
                    index += 1
                }
            }
            x = 28.5
            y += 140
        }
    }
}

extension HomeViewController: MyAvatarDelegate {
    func showUserName(view: MyAvatar, userName: String) {
        print(userName)
    }
}
