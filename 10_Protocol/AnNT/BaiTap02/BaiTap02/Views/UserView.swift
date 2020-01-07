//
//  UserView.swift
//  BaiTap03
//
//  Created by An Nguyễn on 1/2/20.
//  Copyright © 2020 An Nguyễn. All rights reserved.
//

import UIKit

protocol UserViewDelegate: class {
    func handleTap(userView: UserView, value: String)
}

class UserView: View {
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!

    weak var delegate: UserViewDelegate?
    var index: Int?


    @IBAction func handleTapUserImage(_ sender: Any) {
        delegate?.handleTap(userView: self, value: self.usernameLabel.text ?? "")
    }

}

class View: UIView {

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadViewFromNib()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadViewFromNib()
    }

    func loadViewFromNib() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        view.frame = bounds
        view.autoresizingMask = [
            UIView.AutoresizingMask.flexibleWidth,
            UIView.AutoresizingMask.flexibleHeight
        ]
        addSubview(view)
    }
}
