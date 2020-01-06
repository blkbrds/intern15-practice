//
//  HomeViewController.swift
//  BaiTap13
//
//  Created by An Nguyễn on 12/30/19.
//  Copyright © 2019 An Nguyễn. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var profileImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI(){
        setupNavigator()
        profileImageView.layer.borderWidth = 10
        profileImageView.layer.borderColor = UIColor.yellow.cgColor
        profileImageView.layer.cornerRadius = profileImageView.bounds.width/2
        
    }
    
    private func setupNavigator(){
        title = "Your Profile"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24), NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = .red
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3.decrease"), style: .plain, target: self, action: #selector(handleMenu))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus.circle")?.withTintColor(.yellow), style: .plain, target: self, action: #selector(handleMenu))
        navigationController?.navigationBar.tintColor = .yellow
        
    }
    
    
    @objc private func handleMenu(){
        
    }
}
