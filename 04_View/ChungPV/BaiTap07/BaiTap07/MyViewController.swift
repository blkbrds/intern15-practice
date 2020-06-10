//
//  MyViewController.swift
//  BaiTap07
//
//  Created by MBA0168 on 6/11/20.
//  Copyright © 2020 chungiOS. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.isUserInteractionEnabled = true
        nameLabel.isHidden = true
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(self.tap1))
        let duptap = UITapGestureRecognizer(target: self, action: #selector(doubleTap))
        duptap.numberOfTapsRequired = 2
        imageView.addGestureRecognizer(tap1)
        imageView.addGestureRecognizer(duptap)
    }
    @objc func tap1(sender: UITapGestureRecognizer){
        nameLabel.isHidden = false
        nameLabel.text = "Tôi là Cờ hó nè...."
    }
    @objc func doubleTap(sender: UIGestureRecognizer){
        nameLabel.isHidden = false
        nameLabel.text = "Cờ hó là tôi nè.."
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
