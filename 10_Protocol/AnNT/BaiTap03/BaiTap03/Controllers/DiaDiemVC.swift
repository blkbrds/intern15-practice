//
//  DiaDiemVC.swift
//  BaiTap03
//
//  Created by An Nguyễn on 1/3/20.
//  Copyright © 2020 An Nguyễn. All rights reserved.
//

import UIKit

class DiaDiemVC: BaseViewController {

  @IBOutlet var mienButton: [UIButton]!
  
  var diaDiem: DiaDiem = DiaDiem()
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func setupNavigationBar() {
    title = "Miền"
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Tỉnh", style: .plain, target: self, action: #selector(handleTinh))
  }

  @objc private func handleTinh() {
    let tinhVC = TinhVC()
    tinhVC.diaDiem = diaDiem
    navigationController?.pushViewController(tinhVC, animated: true)
  }
  
  @IBAction func mienButton(_ sender: UIButton) {
    mienButton.forEach({ $0.backgroundColor = .gray })
    sender.backgroundColor = .yellow
    diaDiem.mien = sender.titleLabel?.text ?? ""
  }
}


