//
//  HomeViewController.swift
//  Navigation
//
//  Created by PCI0019 on 6/19/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit
protocol HomeViewControllerDelegate: class {
    func clearTextFieldOfLoginView()
}
class HomeViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    var name: String = ""
    
    weak var delegate: HomeViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        welcomeLabel.text = "Welcome \(name)"
        setupView()
    }
    
    func setupView() {
        let backButton = UIBarButtonItem(title: "Logout", style: UIBarButtonItem.Style.plain, target: self, action: #selector(logoutButtonTouchUpInside))
        let nextButton = UIBarButtonItem(title: "Edit", style: UIBarButtonItem.Style.plain, target: self, action: #selector(editButtonTouchUpInside))
        navigationItem.leftBarButtonItem = backButton
        navigationItem.rightBarButtonItem = nextButton
    }
    
    @objc func logoutButtonTouchUpInside() {
        delegate?.clearTextFieldOfLoginView()
        navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func editButtonTouchUpInside() {
        let vc = EditViewController()
        vc.delegate = self 
        navigationController?.pushViewController(vc, animated: true)
    }
}
extension HomeViewController: EdidViewControllerDelegate {
    func editUsername(view: EditViewController, text: String) {
        welcomeLabel.text = "Welcome \(text)"
    }
}
