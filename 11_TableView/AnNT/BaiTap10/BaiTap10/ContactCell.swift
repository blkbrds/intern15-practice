//
//  ContactCell.swift
//  BaiTap10
//
//  Created by An Nguyễn on 1/4/20.
//  Copyright © 2020 An Nguyễn. All rights reserved.
//

import UIKit

class ContactCell: UITableViewCell {

  @IBOutlet weak var userImageVIew: UIImageView!
  @IBOutlet weak var phoneLabel: UILabel!
  @IBOutlet weak var nameLabel: UILabel!
  
  var phone: String = ""
  
  override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
  @IBAction func callButton(_ sender: Any) {
    if let url = URL(string: "tel://\(phone)"), UIApplication.shared.canOpenURL(url) {
      UIApplication.shared.open(url)
    }
  }
}
