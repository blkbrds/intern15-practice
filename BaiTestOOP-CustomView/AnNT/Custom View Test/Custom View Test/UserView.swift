//
//  UserView.swift
//  Custom View Test
//
//  Created by An Nguyễn on 1/13/20.
//  Copyright © 2020 An Nguyễn. All rights reserved.
//

import UIKit

protocol UserViewDelegate: class {
    func closeUserView(for view: UserView)
}

class UserView: UIView {
    @IBOutlet private weak var interestingLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var userImageView: UIImageView!
    @IBOutlet private weak var schooleNameLabel: UILabel!
    @IBOutlet private weak var addressLabel: UILabel!
    @IBOutlet private weak var privateLabel: UILabel!
    @IBOutlet private weak var doctorLabel: UILabel!
    @IBOutlet private weak var engineerLabel: UILabel!
    @IBOutlet private weak var introductionLabel: UILabel!
    
    weak var delegate: UserViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
    }
    
    func setupLayout(){
        self.layer.cornerRadius = 10
        userImageView.layer.cornerRadius = userImageView.bounds.width/2
        userImageView.clipsToBounds = true
    }
    
    @IBAction func closeButton(_ sender: Any) {
        delegate?.closeUserView(for: self)
    }
}
