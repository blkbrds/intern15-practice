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
protocol AreaViewControllerDelegate: class {
    func getLocationButton(locationButton: String, location: Location)
}

enum Location: Int {
    case tinh
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
    var nextTitle: String {
        switch self {
        case .tinh:
            return "Huyện"
        case.huyen:
            return "Done"
        case.mien:
            return "Tỉnh"
        }
    }
}

class AreaViewController: UIViewController {
    
    @IBOutlet var buttonName: [UIButton]!
    
    weak var datasource: AreaViewControllerDatasource?
    weak var delegate: AreaViewControllerDelegate?
    
    var locationTinhButton: String = ""
    var locationHuyenButton: String = ""
    var locationMienButton: String = ""
    
    var area: Location = .tinh
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        changeView()
    }
    
    func setupView() {
        guard let datasource = datasource else { return }
        let location = datasource.getViewController(view: self, location: area)
        for (index, button) in buttonName.enumerated() {
            button.setTitle(location.buttonName + "\(index + 1)", for: .normal)
            button.backgroundColor = location.buttonColor
            title = location.title
        }
    }
    
    func changeView() {
        let doneButton = UIBarButtonItem(title: area.nextTitle, style: UIBarButtonItem.Style.plain, target: self, action: #selector(chooseButton))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    @IBAction func buttonTouchUpInside(_ sender: UIButton) {
        guard let delegate = delegate else { return }
        delegate.getLocationButton(locationButton: sender.titleLabel?.text ?? "empty", location: area)
        
       
        
    }
    
    @objc func chooseButton() {
        if area == .mien {
            area = .tinh
        } else if area == .tinh {
            area = .huyen
        } else {
            navigationController?.popViewController(animated: true)
            return
        }
        setupView()
        changeView()
    
    }
}
