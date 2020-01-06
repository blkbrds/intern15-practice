//
//  MyTableViewCell.swift
//  BaiTap09
//
//  Created by An Nguyễn on 1/4/20.
//  Copyright © 2020 An Nguyễn. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

  @IBOutlet weak var userImageView: UIImageView!
  @IBOutlet weak var usernameLabel: UILabel!
  @IBOutlet weak var userSubtitle: UILabel!
  var indexSelect: Int?

  override func awakeFromNib() {
    super.awakeFromNib()
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }

  func handleTap(index: Int) {
    print("Home - \(index)")
  }

  @IBAction func tapMeButton(_ sender: Any) {
    guard let index = indexSelect else {
      return
    }
    handleTap(index: index)
  }
}
