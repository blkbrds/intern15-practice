//
//  NewsFeedViewController.swift
//  CustomNavigationBar
//
//  Created by Sếp Quân on 3/27/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit

final class NewsFeedViewController: UIViewController {
    // MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        title = "News Feed"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        let  image = UIImage(named: "2")
        navigationController?.navigationBar.setBackgroundImage(image, for: .default)
        let searchButton = UIBarButtonItem(barButtonSystemItem: .search, target: nil, action: nil)
        navigationItem.leftBarButtonItem = searchButton
        let settingButton = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: nil)
        navigationItem.rightBarButtonItem = settingButton
        navigationController?.navigationBar.tintColor = .blue
    }
        
    // MARK: - IBAction
    @IBAction func nextTouchUpInside(_ sender: Any) {
        let vcBarButton = BarButtonViewController()
        self.navigationController?.pushViewController(vcBarButton, animated: true)
    }
    
    @IBAction func preTouchUpInside(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
