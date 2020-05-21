//
//  HomeCell.swift
//  BaiTapCusTomCell
//
//  Created by PCI0012 on 5/21/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit

protocol HomeCellDelegate: class {
    func homeCell(cell: HomeCell, didSelectRowAt index: Int)
}

class HomeCell: UITableViewCell {

    @IBOutlet weak var nameTitleLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var addressLabel: UILabel!
    
    weak var delegate: HomeCellDelegate?
    var index: Int = 0
    var homeCellVM: HomeCellVM? {
        didSet {
            updateView()
        }
    }
    
    private func updateView() {
        guard let homeCellVM = homeCellVM else {
            return
        }
        nameTitleLabel.text = homeCellVM.nameTitle
        avatarImageView.image = UIImage(named: homeCellVM.avatarName)
        addressLabel.text = homeCellVM.address
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBAction func favoriteButtonTouchUpInSide(_ sender: Any) {
        if let delegate = delegate {
            delegate.homeCell(cell: self, didSelectRowAt: index)
        }
    }
}
