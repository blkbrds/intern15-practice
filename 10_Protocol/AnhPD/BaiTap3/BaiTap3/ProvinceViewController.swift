//
//  ProvinceViewController.swift
//  BaiTap3
//
//  Created by PCI0012 on 5/7/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit

class ProvinceViewController: UIViewController {

    @IBOutlet var provinceButtons: [UIButton]!
    
    var newDomain: String = ""
    var province: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Tỉnh"
        configNavigationBar()
        setupUIButton()
        // Do any additional setup after loading the view.
    }
    
    private func setupUIButton() {
        for index in 0..<provinceButtons.count {
            provinceButtons[index].layer.borderWidth = 1.0
            provinceButtons[index].layer.cornerRadius = 10
            provinceButtons[index].clipsToBounds = true
        }
    }
    func configNavigationBar() {
        let districtButton = UIBarButtonItem(title: "Huyện", style: .plain, target: self, action: #selector(doneButtonTouchUpInSide))
        navigationItem.rightBarButtonItem = districtButton
    }
    
    @objc func doneButtonTouchUpInSide() {
        let vc = DistrictViewController()
        vc.newProvince = province
        vc.newDomain = newDomain
        if let navigationController = navigationController {
            navigationController.pushViewController(vc, animated: true)
        }
    }

    @IBAction func provinceButtonTouchUpInSide(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            setupButton(i: 0)
        case 1:
            setupButton(i: 1)
        case 2:
            setupButton(i: 2)
        case 3:
            setupButton(i: 3)
        case 4:
            setupButton(i: 4)
        case 5:
            setupButton(i: 5)
        case 6:
            setupButton(i: 6)
        case 7:
            setupButton(i: 7)
        case 8:
            setupButton(i: 8)
        case 9:
            setupButton(i: 9)
        default:
            print("Error")
        }
    }
    
    func setupButton(i: Int) {
        for index in 0..<provinceButtons.count {
            provinceButtons[index].backgroundColor = .clear
            provinceButtons[index].setTitleColor(.black, for: .normal)
        }
        provinceButtons[i].backgroundColor = .green
        provinceButtons[i].setTitleColor(.black, for: .normal)
        province = "Tỉnh \(i + 1)"
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
