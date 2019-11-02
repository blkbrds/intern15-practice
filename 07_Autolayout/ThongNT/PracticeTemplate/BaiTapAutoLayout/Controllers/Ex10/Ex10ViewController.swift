//
//  Ex10ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

final class Ex10ViewController: BaseViewController {

    @IBOutlet weak var button1WidthConstrain: NSLayoutConstraint!
    @IBOutlet weak var button2WidthConstrain: NSLayoutConstraint!
    @IBOutlet weak var button3WidthConstrain: NSLayoutConstraint!
    @IBOutlet weak var button4WidthConstrain: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func click(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            if button1WidthConstrain.constant != 140 {
                UIView.animate(withDuration: 0.2) {
                    self.button1WidthConstrain.constant = 140
                    self.button2WidthConstrain.constant = 70
                    self.button3WidthConstrain.constant = 70
                    self.button4WidthConstrain.constant = 70
                    self.view.layoutIfNeeded()
                }
            }
        case 1:
            if button2WidthConstrain.constant != 140 {
                UIView.animate(withDuration: 0.2) {
                    self.button1WidthConstrain.constant = 70
                    self.button2WidthConstrain.constant = 140
                    self.button3WidthConstrain.constant = 70
                    self.button4WidthConstrain.constant = 70
                    self.view.layoutIfNeeded()
                }
            }
        case 2:
            if button3WidthConstrain.constant != 140 {
                UIView.animate(withDuration: 0.2) {
                    self.button1WidthConstrain.constant = 70
                    self.button2WidthConstrain.constant = 70
                    self.button3WidthConstrain.constant = 140
                    self.button4WidthConstrain.constant = 70
                    self.view.layoutIfNeeded()
                }
            }
        case 3:
            if button4WidthConstrain.constant != 140 {
                UIView.animate(withDuration: 0.2) {
                    self.button1WidthConstrain.constant = 70
                    self.button2WidthConstrain.constant = 70
                    self.button3WidthConstrain.constant = 70
                    self.button4WidthConstrain.constant = 140
                    self.view.layoutIfNeeded()
                }
            }
        default:
            break
        }
    }
}
