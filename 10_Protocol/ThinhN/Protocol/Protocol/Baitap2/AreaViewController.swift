//
//  AreaViewController.swift
//  Protocol
//
//  Created by PCI0019 on 6/23/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit
protocol AreaViewControllerDatasource: class {
    func getViewController(view: AreaViewController, location: Location) -> Location
}
enum Location: Int {
    case tinh = 0
    case huyen
    case mien
    
    var buttonName: String {
        switch self {
        case .tinh:
            return "Tinh"
        case.huyen:
            return "Huyen"
        case.mien:
            return "Mien"
        }
    }
    var buttonColor: UIColor {
        switch self {
        case .tinh:
            return .green
        case.huyen:
            return.orange
        case.mien:
            return.systemBlue
        }
    }
    var title: String {
        switch self {
        case .tinh:
            return "Tỉnh"
        case.huyen:
            return "Huyện"
        case.mien:
            return "Miền"
        }
    }
}

class AreaViewController: UIViewController {
    
    @IBOutlet var buttonName: [UIButton]!
    
    weak var datasource: AreaViewControllerDatasource?
    
    var location: Location = .tinh
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        let doneButton = UIBarButtonItem(title: location.title, style: UIBarButtonItem.Style.plain, target: self, action: #selector(chooseButton))
        navigationItem.rightBarButtonItem = doneButton
    }
    func setupView() {
        guard let datasource = datasource else { return }
        let location = datasource.getViewController(view: self, location: .mien)
        for (index, button) in buttonName.enumerated() {
            button.setTitle(location.buttonName + "\(index + 1)", for: .normal)
            button.backgroundColor = location.buttonColor
            title = location.title
        }
        
    }
    
    @IBAction func buttonTouchUpInside(_ sender: Any) {
       print("abb")
        //navigationController?.pushViewController(location, animated: true)
       // guard let datasource = datasource else { return }
        
//        let doneButton = UIBarButtonItem(title: "Tinh", style: UIBarButtonItem.Style.plain, target: self, action: #selector(chooseButton))
//        navigationItem.rightBarButtonItem = doneButton
        
    }
    @objc func chooseButton() {
//        let vc = AreaViewController()
//        vc.location = .tinh
//        navigationController?.pushViewController(vc, animated: true)
        setupView()
        
    }
}
