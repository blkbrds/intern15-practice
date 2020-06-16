//
//  AvatarViewController.swift
//  Autolayout
//
//  Created by PCI0019 on 6/16/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class AvatarViewController: UIViewController {
    
    var name: [String] = ["Hoa", "Lan", "Huong", "Nam", "Duy", "Hoa", "Lan", "Huong", "Nam"]
    
    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    func setupView() {
        var x: CGFloat = 0
        var y: CGFloat = 0
        
        let space: CGFloat = 30
        let width: CGFloat = 120
        let heigth: CGFloat = 150
        var dem: Int = 0
        
        for i in 0...2 {
            x = CGFloat(i) * width + CGFloat(i) * space
            for j in 0...2 {
                y = CGFloat(j) * width + CGFloat(j) * space
                if let avatarView = Bundle.main.loadNibNamed("SubView3", owner: self, options: nil)? [0] as? SubView3 {
                    avatarView.frame = CGRect(x: x, y: y, width: width , height: heigth)
                    avatarView.tag = dem
                    avatarView.datasource = self
                    avatarView.delegate = self
                    containerView.addSubview(avatarView)
                    dem += 1
                }
            }
        }
    }
}
extension AvatarViewController: SubView3Datasource {
    func passDataToViewController(view: SubView3) -> String {
        let person = name[view.tag]
        return person
    }
}
extension AvatarViewController: SubView3Delegate {
    func sendDataToViewController(view: SubView3) {
        let person = name[view.tag]
        let alert = UIAlertController(title: "Xin chao", message: "Toi la \(person)", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
