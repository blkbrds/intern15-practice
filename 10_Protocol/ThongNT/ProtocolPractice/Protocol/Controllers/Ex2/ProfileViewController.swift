//
//  ProfileViewController.swift
//  Protocol
//
//  Created by PCI0018 on 11/5/19.
//

import UIKit

final class ProfileViewController: UIViewController {

    @IBOutlet private weak var profileImageView: UIImageView!
    @IBOutlet private weak var profileNameTextField: UITextField!

    private var currentName: String = ""
    var profiles: [ProfileData] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"

        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(updateInformation))
        navigationItem.rightBarButtonItem = doneButton
        profileImageView.image = UIImage(named: "Avatar_img")
        let userDefault = UserDefaults.standard
        if let currentName = userDefault.string(forKey: "usernameClicked") {
            profileNameTextField.text = currentName
            self.currentName = currentName
        }
    }

    @objc func updateInformation() {
        guard let newUsername = profileNameTextField.text, !newUsername.isEmpty else { return }
        Ex2DataManagement.share.saveDataToDocument(data: profiles, currentName: currentName, newName: newUsername)
        navigationController?.popViewController(animated: true)
    }
}
