//
//  AvatarViewController.swift
//  Navigation
//
//  Created by ADMIN on 6/20/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import UIKit

class AvatarViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    var avatarNumbers: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0...30 {
            avatarNumbers.append("Name \(i)")
        }
        setUpView()
    }
    
    func setUpView() {
        for subView in containerView.subviews {
            subView.removeFromSuperview()
        }
        var x: CGFloat = 10
        var y: CGFloat = 70
        let width: CGFloat = 120
        let height: CGFloat = 180
        let space: CGFloat = 30
        var count = 0
        
        for index in 0..<10 {
            y = CGFloat(index) * width + space * CGFloat(index)
            for i in 0...2 {
                x = CGFloat(i) * width + space * CGFloat(i)
                if let avatarView = Bundle.main.loadNibNamed("AvatarView", owner: self, options: nil)? [0] as? AvatarView {
                    avatarView.frame = CGRect(x: x, y: y, width: width, height: height)
                    avatarView.updateName(name: avatarNumbers[count])
                    containerView.addSubview(avatarView)
                    avatarView.tag = count
                    avatarView.delegate = self
                    count += 1
                }
            }
        }
    }
}

extension AvatarViewController: AvatarViewDelegate {
    func showNameLabel(userView: AvatarView) {
        let vc = ProfileViewController()
        vc.delegate = self 
        vc.name = avatarNumbers[userView.tag]
        vc.view.tag = userView.tag
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension AvatarViewController: ProfileViewControllerDelegate {
    func updateName(viewController: ProfileViewController, name: String) {
        avatarNumbers[viewController.view.tag] = name
        setUpView()
    }    
}
