//
//  HomeViewController.swift
//  BaitapCustomView
//
//  Created by ANH NGUYỄN on 1/13/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var HiddenView: UIView!
    @IBOutlet private weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }

    private func setUpUI() {
        scrollView.contentSize = CGSize(width: view.bounds.width, height: 2200)
        let space: CGFloat = 10
        let widthUserView: CGFloat = 100
        let heightUserView: CGFloat = 175
        let yUserView: CGFloat = 0
        let xUserView: CGFloat = space
        let frame = CGRect(x: xUserView, y: yUserView, width: widthUserView, height: heightUserView)
        let avatar = UserView(frame: frame)
        avatar.delegate = self
        scrollView.addSubview(avatar)
    }
}
extension HomeViewController: MyAvatarDelegate {
    func nameAvatar(avatar: String) {
        print(avatar)
    }
}
