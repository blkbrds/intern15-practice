//
//  MyDatePickerViewController.swift
//  PracticeTemplate
//
//  Created by ANH NGUYỄN on 10/16/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

class MyDatePickerViewController: UIViewController {

    @IBOutlet weak var datePickerView: UIDatePicker!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var makeView: UIView!
    
    enum Action {
        case hide
        case show
        case done
        case cancel
    }
    func config() {
      makeView.alpha = 0.5
      contentView.alpha = 1
      isHidden = true
    }
    
    func hide(animation: Bool) {
      if animation {
        UIView.animate(withDuration: 0.5, animations: {
          self.backgroundView.alpha = 0
          self.contentView.alpha = 0
        }) { (done) in
          self.isHidden = true
        }
      } else {
        makeView.alpha = 0
        contentView.alpha = 0
        isHidden = true
      }
    }
    
    func show(animation: Bool) {
      self.isHidden = false
      if animation {
        UIView.animate(withDuration: 0.5) {
          self.makeView.alpha = 0.5
          self.contentView.alpha = 1
        }
      } else {
        makeView.alpha = 0.5
        contentView.alpha = 1
      }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
