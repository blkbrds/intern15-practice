//
//  Ex2ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

final class Ex2ViewController: BaseViewController {

    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var passworkTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    private var users: [User] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login"
        setupNavi()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        users = []
        fetchData()
        userNameTextField.text = ""
        passworkTextField.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    private func fetchData() {
        Ex2DataManagement.shared.preparePlistForObject(forResource: "Ex2UserProperty", ofType: "plist", withURL: "/Ex2UserProperty.plist")
        users = Ex2DataManagement.shared.getUser(fileName: "Ex2UserProperty", type: "plist")
        print("ahihi: \(users)")
    }

    private func setupNavi() {
        title = "Login"
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(settingButtonTag))
        navigationItem.rightBarButtonItem = doneButton
    }
    @objc private func settingButtonTag() {
        guard let username = userNameTextField.text, username != "",
            let password = passworkTextField.text, password != "" else { return }
        UserDefaults.standard.set(username, forKey: "username")
        for user in users where user.userName == username {
            let vc = HomePageViewController()
            vc.user = user
            navigationController?.pushViewController(vc, animated: true)
            return
        }
        print("Login fail")
    }
}
