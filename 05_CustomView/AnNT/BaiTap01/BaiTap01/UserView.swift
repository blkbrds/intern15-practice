//
//  UserView.swift
//  BaiTap04
//
//  Created by An Nguyễn on 12/24/19.
//  Copyright © 2019 An Nguyễn. All rights reserved.
//

import UIKit

protocol MyAvatarDelegate {
    func handleTapDelegate(userView: MyAvatar)
}

class MyAvatar: UIView, UIGestureRecognizerDelegate {
    
    var imageUserView: UIImageView?
    var titleLabel: UILabel?
    var titleTapGesture: UITapGestureRecognizer = {
        let tap = UITapGestureRecognizer()
        tap.numberOfTapsRequired = 1
        return tap
    }()
    
    var imageTapGesture: UITapGestureRecognizer = {
        let tap = UITapGestureRecognizer()
        tap.numberOfTapsRequired = 1
        return tap
    }()
    var delegate: MyAvatarDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.imageUserView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height - 40))
        self.titleLabel = UILabel(frame: CGRect(x: 0, y: imageUserView?.frame.maxY ?? 0, width: self.bounds.width, height: self.bounds.height - (imageUserView?.bounds.height ?? 0)))
        titleLabel?.textAlignment = .center
        titleLabel?.backgroundColor = .blue
        titleLabel?.textColor = .white
        titleLabel?.isUserInteractionEnabled = true
        imageUserView?.isUserInteractionEnabled = true
        self.addSubview(imageUserView!)
        self.addSubview(titleLabel!)
    
        titleTapGesture.addTarget(self, action: #selector(handleTap))
        imageTapGesture.addTarget(self, action: #selector(handleTap))
        titleLabel?.addGestureRecognizer(titleTapGesture)
        imageUserView?.addGestureRecognizer(imageTapGesture)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handleTap(){
        delegate?.handleTapDelegate(userView: self)
    }
    
}
