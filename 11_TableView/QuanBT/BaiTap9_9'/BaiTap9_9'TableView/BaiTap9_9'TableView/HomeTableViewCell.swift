//
//  HomeTableViewCell.swift
//  BaiTap9_9'TableView
//
//  Created by Sếp Quân on 4/3/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit

protocol HomeTableViewCellDelegate: class {
    func tapMe(_ homeTableViewCell: HomeTableViewCell)
}

final class HomeTableViewCell: UITableViewCell {
    // MARK: - IBOutlet
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    // MARK: - Properties
    weak var detegale: HomeTableViewCellDelegate?
    
    // MARK: - Override
    override func awakeFromNib() {
        super.awakeFromNib()
        let tapButton = UIButton(frame: CGRect(x: 300, y: 25, width: 100, height: 50))
        tapButton.setTitle("Tap Me", for: .normal)
        tapButton.setTitleColor(UIColor.blue, for: .normal)
        tapButton.backgroundColor = UIColor.gray
        tapButton.addTarget(self, action: #selector(tapMe), for: .touchUpInside)
        addSubview(tapButton)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Function
    @objc func tapMe() {
        detegale?.tapMe(self)
    }
}
