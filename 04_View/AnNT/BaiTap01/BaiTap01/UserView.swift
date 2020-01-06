//
//  UserView.swift
//  BaiTap04
//
//  Created by An Nguyễn on 12/24/19.
//  Copyright © 2019 An Nguyễn. All rights reserved.
//

import UIKit

protocol UserViewDelegate {
    func handleTapDelegate()
}

class UserView: UIView {
    
    var imageUserView: UIImageView?
    var titleLabel: UILabel?
    var tapgesture: UITapGestureRecognizer = {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        return tap
    }()
    var delegate: UserViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.imageUserView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height - 40))
        self.titleLabel = UILabel(frame: CGRect(x: 0, y: imageUserView?.frame.maxY ?? 0, width: self.bounds.width, height: self.bounds.height - (imageUserView?.bounds.height ?? 0)))
        titleLabel?.textAlignment = .center
        titleLabel?.backgroundColor = .blue
        titleLabel?.textColor = .white
        self.addSubview(imageUserView!)
        self.addSubview(titleLabel!)
    
        titleLabel?.addGestureRecognizer(tapgesture)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handleTap(){
        delegate?.handleTapDelegate()
    }
    
}
