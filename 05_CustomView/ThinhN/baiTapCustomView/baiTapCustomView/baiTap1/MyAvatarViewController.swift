//
//  MyAvatarViewController.swift
//  baiTapCustomView
//
//  Created by ADMIN on 3/26/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import UIKit

class MyAvatarViewController: UIViewController {

    @IBOutlet private weak var scrollView: UIScrollView!
    private let usernames: [Int] = Array(1...30)
    private let images: [String] = Array(repeating: "avatar", count: 30)
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    private func setupView(){
        scrollView.contentSize = CGSize(width: view.bounds.width, height: view.bounds.height)
        let space: CGFloat = 20
        var xUserView: CGFloat = 10
        var yUserView: CGFloat = 0
        let widthUserView:CGFloat = 100
        let heightUserView:CGFloat = 130
        let widthScreen = scrollView.bounds.width
        
        for index in 0..<usernames.count{
            let frame = CGRect(x: xUserView, y: yUserView, width: widthUserView, height: heightUserView)
            let avatar = MyAvatar(frame: frame)
            avatar.updateUI(imageAvatar: images[index], getUsername: usernames[index])
            avatar.delegate = self
            scrollView.addSubview(avatar)
        
            if xUserView + widthUserView > widthScreen - xUserView {
            xUserView = space
            yUserView += heightUserView + space
            } else {
            xUserView += widthUserView + space
            }
        }
    }
}
extension MyAvatarViewController: MyAvatarDelegate{
    func nameAvatar(avatar: String) {
        print(avatar)
    }
}

