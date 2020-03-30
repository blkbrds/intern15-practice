//
//  HomeViewController.swift
//  CustomNavigationBar
//
//  Created by Sếp Quân on 3/27/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    // MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        title = "Gradient NavigationBar"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        let image = UIImage(named: "1")
        navigationController?.navigationBar.setBackgroundImage(image, for: .default)
    }
    
    // MARK: - IBAction
    @IBAction func nextTouchUpInside(_ sender: Any) {
        let vcNewsFeed = NewsFeedViewController()
        self.navigationController?.pushViewController(vcNewsFeed, animated: true)
    }
}
