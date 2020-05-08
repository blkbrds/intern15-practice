//
//  DomainViewController.swift
//  BaiTap3
//
//  Created by PCI0012 on 5/7/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit

class DomainViewController: UIViewController {

    @IBOutlet var domainButtons: [UIButton]!
    
    var domain: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Miền"
        configNavigationBar()
        setupUIButton()
        // Do any additional setup after loading the view.
    }
    
    private func setupUIButton() {
        for i in 0..<domainButtons.count {
            domainButtons[i].layer.borderWidth = 1.0
            domainButtons[i].layer.cornerRadius = 10
            domainButtons[i].clipsToBounds = true
        }
    }
    
    func configNavigationBar() {
        let provinceButton = UIBarButtonItem(title: "Tỉnh", style: .plain, target: self, action: #selector(doneButtonTouchUpInSide))
        navigationItem.rightBarButtonItem = provinceButton
    }
    
    @objc func doneButtonTouchUpInSide() {
        let vc = ProvinceViewController()
        vc.newDomain = domain
        if let navigationController = navigationController {
            navigationController.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func domainButtonTouchUnInSide(_ sender: UIButton) {
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
        for index in 0..<domainButtons.count {
            domainButtons[index].backgroundColor = .clear
            domainButtons[index].setTitleColor(.black, for: .normal)
        }
        domainButtons[i].backgroundColor = .red
        domainButtons[i].setTitleColor(.white, for: .normal)
        domain = "Miền \(i + 1)"
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
