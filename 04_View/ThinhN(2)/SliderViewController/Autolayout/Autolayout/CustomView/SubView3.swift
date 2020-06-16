//
//  SubView3.swift
//  Autolayout
//
//  Created by PCI0019 on 6/16/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit
protocol SubView3Delegate: AvatarViewController {
    func sendDataToViewController(view: SubView3)
}
protocol SubView3Datasource: AvatarViewController {
    func passDataToViewController(view: SubView3) -> String 
    
}

class SubView3: UIView {
    
    @IBOutlet weak var button: UIButton!
    
    var nameButton: String = ""
    
    weak var delegate: SubView3Delegate?
    weak var datasource: SubView3Datasource? {
        didSet {
            setupView()
        }
    }
    @IBAction func buttonTouchUpInsine(_ sender: Any) {
        
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func setupView() {
        guard let name = datasource?.passDataToViewController(view: self) else { return }
        button.titleLabel?.text = name
    }
}

