//
//  DViewController.swift
//  BaiTap1
//
//  Created by PCI0012 on 4/27/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit

class DViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ViewcontrollerD"
        // Do any additional setup after loading the view.
    }

    @IBAction func nextButtonTouchUpInSide(_ sender: Any) {
        let vc = EViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func cButtonTouchUpInSide(_ sender: Any) {
        let vc = (self.navigationController?.viewControllers[2])!
        self.navigationController?.popToViewController(vc, animated: true)
    }
    
    @IBAction func bButtonTouchUpInSide(_ sender: Any) {
        let vc = (self.navigationController?.viewControllers[1])!
        self.navigationController?.popToViewController(vc, animated: true)
    }
    
    @IBAction func rootButtonTouchUpInSide(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
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
