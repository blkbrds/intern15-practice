//
//  BViewController.swift
//  BaiTap1
//
//  Created by PCI0012 on 4/27/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit

class BViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ViewcontrollerB"
        // Do any additional setup after loading the view.
    }

    @IBAction func nextButtonTouchUpInSide(_ sender: Any) {
        let vc = CViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func popButtonTouchUpInSide(_ sender: Any) {
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
