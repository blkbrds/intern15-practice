//
//  AvatarViewController.swift
//  Protocol
//
//  Created by PCI0019 on 6/23/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class AvatarViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    
    var names: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0...30 {
            names.append("Name \(i)")
        }
        setupView()
    }
    func setupView() {
        for subView in containerView.subviews {
            subView.removeFromSuperview()
        }
        var x: CGFloat = 10
        var y: CGFloat = 70
        let width: CGFloat = 120
        let height: CGFloat = 180
        let space: CGFloat = 30
        var count = 0
        for i in 0..<10 {
            y = CGFloat(i) * width +  space * CGFloat(i)
            for index in 0...2 {
                x = CGFloat(index) * width + space * CGFloat(index)
                if let avatarView = Bundle.main.loadNibNamed("AvatarView", owner: self, options: nil)? [0] as? AvatarView {
                    avatarView.frame = CGRect(x: x, y: y, width: width, height: height)
                    avatarView.setupName(name: names[count])
                    avatarView.tag = count
                    avatarView.delegate = self
                    containerView.addSubview(avatarView)
                    count += 1
                }
            }
        }
    }
}
extension AvatarViewController: AvatarViewDelegate {
    func showName(subView: AvatarView) {
        let vc = ProfileViewController()
        vc.delegate = self
        vc.name = names[subView.tag]
        vc.view.tag = subView.tag
        navigationController?.pushViewController(vc, animated: true)
    }
}
extension AvatarViewController: ProfileViewControllerDelegate {
    func showEditNameLabel(viewController: ProfileViewController, text: String) {
        names[viewController.view.tag] = text
        setupView()
    }
}
