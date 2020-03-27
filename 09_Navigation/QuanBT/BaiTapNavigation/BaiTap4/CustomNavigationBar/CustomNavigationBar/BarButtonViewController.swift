//
//  BarButtonViewController.swift
//  CustomNavigationBar
//
//  Created by Sếp Quân on 3/27/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit

final class BarButtonViewController: UIViewController {
    // MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.setBackgroundImage(.none, for: .default)
        navigationController?.navigationBar.backgroundColor = .cyan
        navigationController?.navigationBar.tintColor = .systemPink
        let left1Button = UIBarButtonItem(title: "Left1", style: .plain, target: self, action: #selector(left))
        let left2Button = UIBarButtonItem(title: "Left2", style: .plain, target: self, action: #selector(left))
        navigationItem.leftBarButtonItems = [left1Button, left2Button]
        let right1Button = UIBarButtonItem(title: "Right1", style: .plain, target: self, action: #selector(right))
        let right2Button = UIBarButtonItem(title: "Right2", style: .plain, target: self, action: #selector(right))
        navigationItem.rightBarButtonItems = [ right1Button, right2Button]
    }
    
    // MARK: - Function
    @objc private func left() {
    }
    
    @objc private func right() {
    }
    
    // MARK: - IBAction
    @IBAction func preTouchUpInside(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func rootTouchUpInside(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
