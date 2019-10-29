//
//  AppDelegate.swift
//  BaiTap4.1
//
//  Created by ANH NGUYỄN on 10/7/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import UIKit

struct Person {
    var name: String
    var avatar: String
    init(_ name: String, _ avatar: String) {
        self.name = name
        self.avatar = avatar
    }
}

class Ex02ViewController: UIViewController {

    var window: UIWindow?
    
       func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
           // Override point for customization after application launch.
           window = UIWindow(frame: UIScreen.main.bounds)
           window?.backgroundColor = .white
           let homeViewController = HomeViewController()
           window?.rootViewController = homeViewController
           window?.makeKeyAndVisible()
           
           return true
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
