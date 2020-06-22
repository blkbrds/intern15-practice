//
//  HomeViewController3.swift
//  Autolayout
//
//  Created by PCI0019 on 6/15/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class HomeViewController3: UIViewController {
    var arrInformation: [Information] = [.email, .username, .birthday, .location, .phone_number, .job, .password, .confirm_password]
    let countryArr = ["America", "China", "Japan", "Russian", "Vietnam"]
    let jobArr = ["Professor", "Teacher", "Student", "Other"]
    var password: String = ""
    var confirmPassword: String = ""
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var subViews: [UpdateHomeView]!
    @IBOutlet weak var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for view in subViews {
            view.datasource = self
            view.delegate = self
        }
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyBoard))
        contentView.addGestureRecognizer(tap)
    }
    
   @objc func dismissKeyBoard() {
        view.endEditing(true)
    }
    
    @IBAction func resignButtonTouchUpInsine(_ sender: Any) {
        var title: String = ""
        if password == confirmPassword {
            title = "Ban da dang ki thanh cong"
        } else {
            title = "Password và Confirm password không khớp"
        }
        let alert = UIAlertController(title: title, message: nil, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

extension HomeViewController3: SubView2Datasource {
    func getDataForPickerView(subView: UpdateHomeView) -> [String] {
        switch arrInformation[subView.tag] {
        case .location:
            return countryArr
        case .job:
            return jobArr
        default:
            return []
        }
    }
    func getInformation(subView: UpdateHomeView) -> Information {
        let name = arrInformation[subView.tag]
        return name
    }
}

extension HomeViewController3: SubView2Delegate {
    func sendDataToViewController(text: String, subView: UpdateHomeView) {
        switch arrInformation[subView.tag] {
        case .password:
            password = text
        case .confirm_password:
            confirmPassword = text
        default:
            break
        }
    }
}
