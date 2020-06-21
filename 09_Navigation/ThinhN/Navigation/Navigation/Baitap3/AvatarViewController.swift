//
//  AvatarViewController.swift
//  Navigation
//
//  Created by ADMIN on 6/20/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import UIKit

class AvatarViewController: UIViewController {
    
    @IBOutlet weak var containerView: AvatarView!
    var names: [String] = Array(repeatElement("Name", count: 15))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
         let touch = UITapGestureRecognizer(target: self, action: #selector(pushToProfile))
        view.addGestureRecognizer(touch)
        
    }
    func setUpView() {
        var x: CGFloat = 10
        var y: CGFloat = 70
        let width: CGFloat = 120
        let height: CGFloat = 180
        let space: CGFloat = 30
        var dem: Int = 0
        for index in 0...2 {
            x = CGFloat(index) * width + space * CGFloat(index)
            for index in 0..<names.count - 1 {
                y = CGFloat(index) * width + space * CGFloat(index) + space
                if let label = Bundle.main.loadNibNamed("AvatarView", owner: self, options: nil)? [0] as? AvatarView {
                    label.frame = CGRect(x: x, y: y, width: width, height: height)
                    label.updateName(name: dem)
                    dem += 1
                    label.delegate = self 
                    containerView.addSubview(label)
                }
            }
        }
    }
    @objc func pushToProfile() {
        let vc = ProfileViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
//    func popToProfileView() {
//        let vc = ProfileViewController()
//        navigationController?.pushViewController(vc, animated: true)
//    }
}
extension AvatarViewController: AvatarViewDelegate {
    func showNameLabel(userView: AvatarView) {
    }
    
    
    
}
//extension AvatarViewController: AvatarViewDatasource {
////    func configNameLabel(userView: AvatarView) -> String {
////       // let names = names[AvatarView.index]
////    }
//
//
//}
