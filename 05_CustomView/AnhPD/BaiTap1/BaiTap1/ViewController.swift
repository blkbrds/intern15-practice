//
//  ViewController.swift
//  BaiTap1
//
//  Created by PCI0012 on 3/30/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit

class ViewController: UIViewController, MyAvatarDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    let name: [String] = ["anh","binh","cong","dat","em","phuoc","giang","hiep","quoc","quang","tien","ro","thuy","yen","uyen","long","son","phong","truong","tung","khoan","linh","hoang","hung","viet","man","ninh","dieu","ly","luan"]
    let image: [String] = Array(repeating: "ronaldo", count: 30)
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width: view.bounds.width, height: view.bounds.height)
        var toaDoX = 35
        var toaDoY = 100
        
        for i in 0..<30 {
        let avatar = MyAvatar(frame: CGRect(x: toaDoX, y: toaDoY, width: 100, height: 125))
        avatar.userName!.text = name[i]
        toaDoX += 130
        if (i + 1) % 3 == 0 {
            toaDoY += 150
            toaDoX = 35
            }
        avatar.delegate = self
        scrollView.addSubview(avatar)
        }

        // Do any additional setup after loading the view.
    }
    func didTap(name: String) {
        print("\(name)")
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
