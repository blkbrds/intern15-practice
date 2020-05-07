//
//  AvatarViewController.swift
//  BaiTap2
//
//  Created by PCI0012 on 5/4/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit

class AvatarViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    var coordinatesX: CGFloat = 10
    var coordinatesY: CGFloat = 10
    
    var names: [String] = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        // Do any additional setup after loading the view.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.loadAvatar()
        }
    }
    
    func loadAvatar() {
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 1.85)
        for i in 1...30 {
            let avatar = Bundle.main.loadNibNamed("AvatarView", owner: self, options: nil)?.first as? AvatarView
            if let avatar = avatar {
                avatar.frame = CGRect(x: coordinatesX, y: coordinatesY, width: (UIScreen.main.bounds.width - CGFloat(40)) / 3, height: (UIScreen.main.bounds.width - CGFloat(40)) / 3)
                avatar.tag = i
                coordinatesX += avatar.frame.width + 10
                avatar.userName = names[i - 1]
                avatar.delegate = self
                if i % 3 == 0 {
                    coordinatesY += (UIScreen.main.bounds.width - CGFloat(40)) / 3 + 10
                    coordinatesX = 10
                }
                avatar.loadView()
                scrollView.addSubview(avatar)
            }
        }
    }
}

extension AvatarViewController: AvataViewDelegate {
    func tap(userName: String, imageView: String, index: Int) {
        let vc = ProfileViewController()
        vc.delegate = self
        vc.userName = userName
        vc.imageView = imageView
        vc.index = index
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension AvatarViewController: ProfileViewControllerDelegate {
    func controller(controller: ProfileViewController, needPerfomAction action: ProfileViewController.Action) {
        switch action {
        case .updateData(let newName, let index):
            guard index > 0 && index <= names.count, let newName = newName else { return }
            names[index - 1] = newName
            for subView in scrollView.subviews {
                if let avataView = subView as? AvatarView, avataView.tag == index {
                    avataView.userName = names[index - 1]
                    avataView.loadView()
                }
            }
        }
    }
}
