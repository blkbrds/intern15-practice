//
//  ViewController.swift
//  BaiTap4
//
//  Created by PCI0012 on 4/29/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        //Add image
        let image = UIImage(named: "View")
        navigationController?.navigationBar.setBackgroundImage(image, for: .default)
        //Add search
        let searchButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: nil)
        navigationController?.navigationBar.tintColor = .systemRed
        navigationItem.leftBarButtonItem = searchButton
        //add
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
        navigationController?.navigationBar.tintColor = .systemRed
        navigationItem.rightBarButtonItem = addButton
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
