//
//  App.swift
//  FinalProject
//
//  Created by Bien Le Q. on 8/26/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import UIKit
import MVVM
import SwiftUtils

class ViewController: UIViewController, MVVM.View {

    // Conformance for ViewEmptyProtocol
    var isViewEmpty: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.accessibilityIdentifier = String(describing: type(of: self))
        view.removeMultiTouch()
        setupUI()
        setupData()
    }
    
    func setupUI() {}
    
    func setupData() {}
}
