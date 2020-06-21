//
//  AvatarView.swift
//  Navigation
//
//  Created by ADMIN on 6/20/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import UIKit
protocol AvatarViewDatasource: class {
    func configNameLabel(userView: AvatarView) -> String
}

protocol AvatarViewDelegate: class {
    func showNameLabel(userView: AvatarView)
}
class AvatarView: UIView {

    @IBOutlet weak var avatarView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    weak var delegate: AvatarViewDelegate?
    weak var datasource: AvatarViewDatasource?
    
    func setupName() {
        guard let name = datasource?.configNameLabel(userView: self) else { return }
        nameLabel.text = name
    }
    func pushToProFileView() {
        
    }
    
    func updateName(name: Int) {
        nameLabel.text = "Name \(name)"
    }
    
    @IBAction func buttonTouchUpInsine(_ sender: Any) {
        guard let delegate = delegate?.showNameLabel(userView: self) else {return }
    }
}
