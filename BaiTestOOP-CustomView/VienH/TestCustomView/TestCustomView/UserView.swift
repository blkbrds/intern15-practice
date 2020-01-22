//
//  UserView.swift
//  TestCustomView
//
//  Created by user on 1/15/20.
//  Copyright © 2020 VienH. All rights reserved.
//

import SwiftUI

protocol UserViewDelegate: class {
    func closeUserView(for View: UserView)
}

class UserView: UIView {

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var schoolLabel: UILabel!
    @IBOutlet weak var engineerButton: UIButton!
    @IBOutlet weak var doctorButton: UIButton!
    @IBOutlet weak var privateButton: UIButton!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var inforTextView: UITextView!

    weak var delegate: UserViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func setupLayout() {
        self.layer.cornerRadius = 30
        userImageView.layer.cornerRadius = userImageView.bounds.width / 2
        userImageView.clipsToBounds = true
        inforTextView.layer.cornerRadius = 20
        inforTextView.layer.borderWidth = 1
        inforTextView.layer.borderColor = UIColor.black.cgColor
    }

    @IBAction func closeUserViewButton(_ sender: Any) {
        delegate?.closeUserView(for: self)
    }
}
