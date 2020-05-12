//
//  DistrictViewController.swift
//  BaiTap3
//
//  Created by PCI0012 on 5/6/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit

class DistrictViewController: UIViewController {

    @IBOutlet var districtButtons: [UIButton]!
    
    var newDomain: String = ""
    var newProvince: String = ""
    var district: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Huyện"
        configNavigationBar()
        setupUIButton()
    }
    
    private func setupUIButton() {
        for index in 0..<districtButtons.count {
            districtButtons[index].layer.borderWidth = 1.0
            districtButtons[index].layer.cornerRadius = 10
            districtButtons[index].clipsToBounds = true
        }
    }
    
    func configNavigationBar() {
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneButtonTouchUpInSide))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    @objc func doneButtonTouchUpInSide() {
        let vc = self.navigationController?.viewControllers[0] as? LocationViewController
        if let vc = vc {
            vc.dataSource = self
            if let navigationController = navigationController {
                navigationController.popToViewController(vc, animated: true)
            }
        }
    }
    
    @IBAction func DistrictButtonTouchUpInSide(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            chooseButtonTouchUpInSide(i: 0)
        case 1:
            chooseButtonTouchUpInSide(i: 1)
        case 2:
            chooseButtonTouchUpInSide(i: 2)
        case 3:
            chooseButtonTouchUpInSide(i: 3)
        case 4:
            chooseButtonTouchUpInSide(i: 4)
        case 5:
            chooseButtonTouchUpInSide(i: 5)
        case 6:
            chooseButtonTouchUpInSide(i: 6)
        case 7:
            chooseButtonTouchUpInSide(i: 7)
        case 8:
            chooseButtonTouchUpInSide(i: 8)
        case 9:
            chooseButtonTouchUpInSide(i: 9)
        default:
            print("Error")
        }
    }
    
    func  chooseButtonTouchUpInSide(i: Int) {
        for index in 0..<districtButtons.count {
            districtButtons[index].backgroundColor = .clear
            districtButtons[index].setTitleColor(.black, for: .normal)
        }
        districtButtons[i].backgroundColor = .blue
        districtButtons[i].setTitleColor(.white, for: .normal)
        district = "Huyện \(i + 1)"
        
    }
}

extension DistrictViewController: LocationViewControllerDataSource {
    func getDomain() -> String {
        return newDomain
    }
    
    func getProvince() -> String {
        return newProvince
    }
    
    func getDistrict() -> String {
        return district
    }


}
