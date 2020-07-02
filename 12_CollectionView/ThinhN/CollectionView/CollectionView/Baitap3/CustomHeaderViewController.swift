//
//  CustomHeaderViewController.swift
//  CollectionView
//
//  Created by PCI0019 on 7/2/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

struct Member {
    let name: String
    let avatar: UIImage
}
enum Phone: Int {
    case iphone
    case samsung
    case xiaomi
    var titleName: String {
        switch self {
        case .iphone:
            return "Iphone"
        case.samsung:
            return "SamSung"
        default:
            return "Xiaomi"
        }
    }
    var member: [Member] {
        switch self {
        case .iphone:
            return [Member(name: "iphone 6", avatar: #imageLiteral(resourceName: "download")), Member(name: "iphone 6s", avatar: #imageLiteral(resourceName: "download")), Member(name: "iphone 7", avatar: #imageLiteral(resourceName: "download"))]
        case .samsung:
            return [Member(name: "Note 9", avatar: #imageLiteral(resourceName: "download")), Member(name: "Note 10", avatar: #imageLiteral(resourceName: "download")), Member(name: "S9", avatar: #imageLiteral(resourceName: "download")), Member(name: "S10", avatar: #imageLiteral(resourceName: "download")), Member(name: "S10 +", avatar: #imageLiteral(resourceName: "download"))]
        default:
            return [Member(name: "Mi 8", avatar: #imageLiteral(resourceName: "download")), Member(name: "Mi 9", avatar: #imageLiteral(resourceName: "download")), Member(name: "Mi 10", avatar: #imageLiteral(resourceName: "download"))]
        }
    }
    

}

class CustomHeaderViewController: UIViewController {

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
