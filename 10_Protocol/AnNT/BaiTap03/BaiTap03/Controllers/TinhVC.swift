//
//  TinhVC.swift
//  BaiTap03
//
//  Created by An Nguyễn on 1/3/20.
//  Copyright © 2020 An Nguyễn. All rights reserved.
//

import UIKit

class TinhVC: BaseViewController {

  @IBOutlet var tinhButton: [UIButton]!
  var diaDiem: DiaDiem?

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func setupNavigationBar() {
    title = "Tỉnh"
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Huyện", style: .plain, target: self, action: #selector(handleTinh))
  }

  @objc private func handleTinh() {
    if let diaDiem = diaDiem {
      let huyenVC = HuyenVC()
      huyenVC.diaDiem = diaDiem
      navigationController?.pushViewController(huyenVC, animated: true) }

  }

  @IBAction func tinhButton(_ sender: UIButton) {
    tinhButton.forEach({ $0.backgroundColor = .gray })
    sender.backgroundColor = .yellow
    diaDiem?.tinh = sender.titleLabel?.text ?? ""
  }
}
