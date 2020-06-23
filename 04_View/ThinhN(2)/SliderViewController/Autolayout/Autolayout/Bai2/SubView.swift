//
//  SubView.swift
//  Autolayout
//
//  Created by PCI0019 on 6/4/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

protocol SubViewDatasource: class {
    func getValueFromViewController(userView: SubView) -> Person
}
protocol SubViewDelegate: class {
    func sendValueToViewController(userView: SubView)
}

class SubView: UIView {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    weak var delegate: SubViewDelegate?
    weak var dataSource: SubViewDatasource? {
        didSet {
            setupView()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        xibSetup()
    }
    private func xibSetup() {
        let nib = UINib(nibName: "SubView", bundle: .main)
        nib.instantiate(withOwner: self, options: nil)
        addSubview(containerView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.layer.cornerRadius = 75
        imageView.layer.borderWidth = 0.5
    }

    func setupView() {
        guard let person = dataSource?.getValueFromViewController(userView: self) else { return }
        nameLabel.text = person.name
        birthdayLabel.text = person.date
    }

    @IBAction func buttonTouchUpInside(_ sender: Any) {
        delegate?.sendValueToViewController(userView: self)
    }
}
