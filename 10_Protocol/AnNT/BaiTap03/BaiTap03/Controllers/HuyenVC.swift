//
//  HuyenVC.swift
//  BaiTap03
//
//  Created by An Nguyễn on 1/3/20.
//  Copyright © 2020 An Nguyễn. All rights reserved.
//

import UIKit

class HuyenVC: BaseViewController {
  
  @IBOutlet var huyenButton: [UIButton]!
  var diaDiem: DiaDiem?

  override func viewDidLoad() {
    super.viewDidLoad()

  }

  override func setupNavigationBar() {
    title = "Huyện"
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(handleDone))
  }

  @objc private func handleDone() {
    navigationController?.popToRootViewController(animated: true)
  }
  
  @IBAction func huyenButton(_ sender: UIButton) {
    huyenButton.forEach({ $0.backgroundColor = .gray })
    sender.backgroundColor = .yellow
    diaDiem?.huyen = sender.titleLabel?.text ?? ""
    NotificationCenter.default.post(name: .didReceiveData, object: diaDiem)
  }
}
