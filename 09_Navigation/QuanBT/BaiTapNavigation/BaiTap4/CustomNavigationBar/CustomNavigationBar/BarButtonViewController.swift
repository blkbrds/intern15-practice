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
        super.viewWillAppear(animated)
        navigationController?.navigationBar.setBackgroundImage(.none, for: .default)
        navigationController?.navigationBar.backgroundColor = .cyan
        navigationController?.navigationBar.tintColor = .systemPink
        let left1Button = UIBarButtonItem(title: "Left1", style: .plain, target: nil, action: nil)
        let left2Button = UIBarButtonItem(title: "Left2", style: .plain, target: nil, action: nil)
        navigationItem.leftBarButtonItems = [left1Button, left2Button]
        let right1Button = UIBarButtonItem(title: "Right1", style: .plain, target: nil, action: nil)
        let right2Button = UIBarButtonItem(title: "Right2", style: .plain, target: nil, action: nil)
        let profile = UIBarButtonItem(image: UIImage(named: "profile"), style: .plain, target: nil, action: nil)
        navigationItem.rightBarButtonItems = [right1Button, right2Button, profile]
    }
    
    // MARK: - IBAction
    @IBAction func preButtonTouchUpInside(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func rootButtonTouchUpInside(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
