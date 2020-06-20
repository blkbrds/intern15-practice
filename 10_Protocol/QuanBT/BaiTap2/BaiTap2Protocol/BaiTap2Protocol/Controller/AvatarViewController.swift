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
    @IBOutlet private weak var scrollView: UIScrollView!
    
    // MARK: - Properties
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
        for index in 0 ..< DataUser.shared.usenames.count {
            let frame = CGRect(x: xUserView, y: yUserView, width: widthUserView, height: heightUserView)
            let avatar = MyAvatar(frame: frame)
            avatar.updateUI(imageAvatar: DataUser.shared.images[index], getUsername: DataUser.shared.usenames[index])
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
        for index in 0 ..< DataUser.shared.usenames.count {
            if avatar == DataUser.shared.usenames[index] {
                temp = index
            }
        }
        vcProfile.delegate = self
        self.navigationController?.pushViewController(vcProfile, animated: true)
    }
}

extension AvatarViewController: MyProfileDelegate {
    func profileName(name: String) {
        DataUser.shared.usenames[temp] = name
    }
}
