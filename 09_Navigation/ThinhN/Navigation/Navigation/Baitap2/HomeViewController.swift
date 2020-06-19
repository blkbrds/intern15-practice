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
        let backButton = UIBarButtonItem(title: "Logout", style: UIBarButtonItem.Style.plain, target: self, action: #selector(popToLoginView))
        let nextButton = UIBarButtonItem(title: "Edit", style: UIBarButtonItem.Style.plain, target: self, action: #selector(pushToEditView))
        navigationItem.leftBarButtonItem = backButton
        navigationItem.rightBarButtonItem = nextButton
    }

    @objc func popToLoginView() {
        delegate?.clearTextFieldOfLoginView()
        navigationController?.popToRootViewController(animated: true)
    }

    @objc func pushToEditView() {
        let vc = EditViewController()
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
}
extension HomeViewController: EditViewControllerDelegate {
    func showNewUsername(view: EditViewController, userName: String) {
        welcomeLabel.text = userName
    }
    
   
}
