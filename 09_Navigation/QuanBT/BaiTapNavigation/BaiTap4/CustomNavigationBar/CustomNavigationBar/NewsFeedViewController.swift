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
        let searchButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(search))
        navigationItem.leftBarButtonItem = searchButton
        let settingButton = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(search))
        navigationItem.rightBarButtonItem = settingButton
        navigationController?.navigationBar.tintColor = .blue
    }
    
    // MARK: - Function
    @objc private func search() {
    }
    
    @objc private func profile() {
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
