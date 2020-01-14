//
//  View1ViewController.swift
//  Navigation
//
//  Created by user on 12/10/19.
//  Copyright © 2019 VienH. All rights reserved.
//

import UIKit

final class View1ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "View 1"

        let searchButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 40))
        searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        searchButton.setImage(UIImage(named: "icons8-search-50"), for: .normal)
        let settingButton = UIButton(frame: CGRect(x: 50, y: 0, width: 50, height: 44))
        settingButton.addTarget(self, action: #selector(settingButtonTapped), for: .touchUpInside)
        settingButton.setImage(UIImage(named: "icons8-gear-50"), for: .normal)
        let rightCustomView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 44))
        rightCustomView.bounds = rightCustomView.bounds.offsetBy(dx: -20, dy: 0)
        rightCustomView.addSubview(searchButton)
        rightCustomView.addSubview(settingButton)
        let rightBarButton = UIBarButtonItem(customView: rightCustomView)
        navigationItem.rightBarButtonItem = rightBarButton
    }

    @objc private func searchButtonTapped() {
        print("go to search")
    }

    @objc private func settingButtonTapped() {
        print("go to setting")
    }

    @IBAction private func pushToNextScreen() {
        let vc = View2ViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction private func popToHome() {
        navigationController?.popToRootViewController(animated: true)
    }
}
