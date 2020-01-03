//
//  HomeViewController.swift
//  BaiTap03
//
//  Created by An Nguyễn on 1/1/20.
//  Copyright © 2020 An Nguyễn. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

  var names = Array(repeating: "An Nguyen", count: 40)

  override func viewDidLoad() {
    super.viewDidLoad()

  }

  override func viewDidAppear(_ animated: Bool) {
    setupUI()
  }

  private func setupUI() {
    title = "Home"
    let scrollView = UIScrollView()
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(scrollView)
    view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": scrollView]))
    view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": scrollView]))

    let widthUserView: CGFloat = (view.bounds.width - 10 * 4) / 3
    let heightUserView: CGFloat = 300
    scrollView.contentSize = CGSize(width: view.bounds.width, height: 39 / 3 * 10 + heightUserView * 40 / 3 + 20 * 2)
    var xCurrent: CGFloat = 10
    var yCurrent: CGFloat = 20
    for index in 1...40 {
      let userView = UserView(frame: CGRect(x: xCurrent, y: yCurrent, width: widthUserView, height: heightUserView))
      userView.delegate = self
      userView.userImageView.backgroundColor = .red
      userView.usernameLabel.text = "\(names[index - 1]) \(index)"
      userView.index = index - 1
      scrollView.addSubview(userView)
      xCurrent += 10 + widthUserView
      if index % 3 == 0 {
        yCurrent += 10 + heightUserView
        xCurrent = 10
      }
    }
  }
}

extension HomeViewController: UserViewDelegate {
  func handleTap(userView: UserView, value: String) {
    let profileVC = ProfileViewController()
    profileVC.name = value
    profileVC.indexValue = userView.index
    profileVC.delegate = self
    navigationController?.pushViewController(profileVC, animated: true)
  }
}

extension HomeViewController: ProfileViewControllerDelegate {
  func handleUpdateData(name: String, index: Int?) {
    //Update names
    guard let index = index else {
      return
    }
    self.names[index] = name
    print(names[index])
  }
}
