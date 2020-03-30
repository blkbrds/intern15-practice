//
//  AvatarViewController.swift
//  BaiTap2Protocol
//
//  Created by Sếp Quân on 3/30/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit

final class AvatarViewController: UIViewController {
     // MARK: - IBOutlet
    @IBOutlet weak var scrollView: UIScrollView!
    
    // MARK: - Properties
    var usenames: [String] = ["Quan", "Thang", "Tan", "Vu", "Hien", "Anh", "Thien", "Tay", "Quoc", "Thinh", "Quan2", "Thang2", "Tan2", "Vu2", "Hien2", "Anh2", "Thien2", "Tay2", "Quoc2", "Thinh2", "Quan3", "Thang3", "Tan3", "Vu3", "Hien3", "Anh3", "Thien3", "Tay3", "Quoc3", "Thinh3"]
    private let images: [String] = Array(repeating: "avatar", count: 30)
    private var temp = 0
    
    //MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupView()
    }
    
    // MARK: - Private function
    private func setupView() {
        title = "Home"
        scrollView.contentSize = CGSize(width: view.bounds.width, height: view.bounds.height)
        var xUserView: CGFloat = 45
        var yUserView: CGFloat = 0
        let widthUserView: CGFloat = 100
        let heightUserView: CGFloat = 130
        let widthScreen = scrollView.bounds.width
        let space: CGFloat = 10
        let nameuser = ProfileViewController()
        nameuser.delegate = self
        for index in 0 ..< usenames.count {
            let frame = CGRect(x: xUserView, y: yUserView, width: widthUserView, height: heightUserView)
            let avatar = MyAvatar(frame: frame)
            avatar.updateUI(imageAvatar: images[index], getUsername: usenames[index])
            avatar.delegate = self

            scrollView.addSubview(avatar)
            
            if xUserView + widthUserView > widthScreen - xUserView {
                xUserView = 45
                yUserView += heightUserView + space
            } else {
                xUserView += widthUserView + space
            }
        }
    }
}

// MARK: - Extension
extension AvatarViewController: MyAvatarDelegate {
    func nameAvatar(name avatar: String ) {
        let vcProfile = ProfileViewController()
        vcProfile.username = avatar
        for index in 0 ..< usenames.count {
            if avatar == usenames[index] {
                temp = index
            }
        }
        self.navigationController?.pushViewController(vcProfile, animated: true)
    }
}

extension AvatarViewController: MyProfileDelegate {
    func profileName(name nameuser: String) {
        let vcAvatar = AvatarViewController()
        vcAvatar.usenames[temp] = nameuser
    }
}
