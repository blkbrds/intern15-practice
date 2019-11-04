//
//  ProfileViewController.swift
//  Navigation


import UIKit

final class ProfileViewController: UIViewController {

    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet weak var usernameTextField: UITextField!

    private var currentName: String = ""
    var users: [AvatarData] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"

        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(updateInformation))
        navigationItem.rightBarButtonItem = doneButton

        avatarImageView.image = UIImage(named: "Avatar_img")

        let userDefault = UserDefaults.standard
        if let currentName = userDefault.string(forKey: "usernameClicked") {
            usernameTextField.text = currentName
        }
    }

    @objc func updateInformation() {
        guard let newUsername = usernameTextField.text, !newUsername.isEmpty else { return }
        Ex3DataManagement.share.saveDataToDocument(data: users, currentName: currentName, newName: newUsername)
        navigationController?.popViewController(animated: true)
    }
}
