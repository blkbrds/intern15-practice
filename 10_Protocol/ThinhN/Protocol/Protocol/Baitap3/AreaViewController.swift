//
//  AreaViewController.swift
//  Protocol
//
//  Created by PCI0019 on 6/23/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

protocol AreaViewControllerDelegate: class {
    func passChooseLocation(viewController: AreaViewController, chooseLocationName: String)
}

enum Location: Int {
    case tinh
    case huyen
    case mien
    
    var buttonName: String {
        switch self {
        case .tinh:
            return "Tinh"
        case .huyen:
            return "Huyen"
        case .mien:
            return "Mien"
        }
    }
    var buttonColor: UIColor {
        switch self {
        case .tinh:
            return .green
        case .huyen:
            return .orange
        case .mien:
            return .systemBlue
        }
    }
    var title: String {
        switch self {
        case .tinh:
            return "Tỉnh"
        case .huyen:
            return "Huyện"
        case .mien:
            return "Miền"
        }
    }
    var nextButtonTitle: String {
        switch self {
        case .tinh:
            return "Huyện"
        case .huyen:
            return "Done"
        case .mien:
            return "Tỉnh"
        }
    }
}

class AreaViewController: UIViewController {
    
    @IBOutlet var buttons: [UIButton]!
    weak var delegate: AreaViewControllerDelegate?
    var area: Location = .tinh
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        changeView()
    }
    
    func setupView() {
        for (index, button) in buttons.enumerated() {
            button.setTitle(area.buttonName + "\(index + 1)", for: .normal)
            button.backgroundColor = area.buttonColor
            title = area.title
        }
    }

    func changeView() {
        let nextButton = UIBarButtonItem(title: area.nextButtonTitle, style: UIBarButtonItem.Style.plain, target: self, action: #selector(nextButtonTouchUpInside))
        navigationItem.rightBarButtonItem = nextButton
    }
    
    @IBAction func buttonTouchUpInside(_ sender: UIButton) {
        guard let delegate = delegate else { return }
        delegate.passChooseLocation(viewController: self, chooseLocationName: sender.titleLabel?.text ?? "empty")
    }
    
    @objc func nextButtonTouchUpInside() {
        if area == .mien {
            let vc = AreaViewController()
            vc.area = .tinh
            vc.delegate = self
            navigationController?.pushViewController(vc, animated: true)
        } else if area == .tinh {
            let vc = AreaViewController()
            vc.area = .huyen
            vc.delegate = self
            navigationController?.pushViewController(vc, animated: true)
        } else {
            navigationController?.popToRootViewController(animated: true)
            return
        }
    }
}
extension AreaViewController: AreaViewControllerDelegate {
    func passChooseLocation(viewController: AreaViewController, chooseLocationName: String) {
        delegate?.passChooseLocation(viewController: viewController, chooseLocationName: chooseLocationName)
    }
}
