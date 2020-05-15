//
//  ViewController.swift
//  BaiTap2
//
//  Created by PCI0012 on 3/30/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tamGiacTrang: UIImageView!
    @IBOutlet weak var tamGiacXanh: UIImageView!
    @IBOutlet weak var labelKeo: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }

    @IBAction func xuLyKeo(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        guard let senderView = sender.view else {
            return
        }
        if senderView.center.y + translation.y >= tamGiacTrang.frame.minY && senderView.center.y + translation.y <= tamGiacTrang.frame.maxY {
            senderView.center = CGPoint(x: senderView.center.x, y: senderView.center.y + translation.y)
            sender.setTranslation(.zero, in: view)
            tamGiacXanh.frame = CGRect(x: 90, y: labelKeo.center.y, width: 230, height: tamGiacTrang.frame.maxY - labelKeo.center.y)
            let temp = (tamGiacXanh.frame.height / tamGiacTrang.frame.height) * 100
            labelKeo.text = "\(Int(temp))"
            textField.text = "\(Int(temp))"
        }
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
