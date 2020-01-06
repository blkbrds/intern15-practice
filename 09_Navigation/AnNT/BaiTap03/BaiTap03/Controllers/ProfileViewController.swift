//
//  ProfileViewController.swift
//  BaiTap03
//
//  Created by An Nguyễn on 1/2/20.
//  Copyright © 2020 An Nguyễn. All rights reserved.
//

import UIKit

protocol ProfileViewControllerDelegate: class {
  func handleUpdateData(name: String, index: Int?)
}

class ProfileViewController: UIViewController {

  @IBOutlet weak var usernameTextField: UITextField!
  @IBOutlet weak var userImageVIew: UIImageView!
  
  var name: String?
  var indexValue: Int?
  weak var delegate: ProfileViewControllerDelegate?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }

  override func viewDidAppear(_ animated: Bool) {
  }

  private func setupUI() {
    title = "Profile"
    navigationItem.rightBarButtonItem =  UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(handleDone))
    usernameTextField.text = name
  }
  
  @objc private func handleDone(){
    delegate?.handleUpdateData(name: usernameTextField.text ?? "", index: self.indexValue)
    navigationController?.popViewController(animated: true)
  }
}
