//
//  Ca.swift
//  ProtocolPractice
//
//  Created by PCI0018 on 11/5/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import Foundation

final class Results {

    static let result = Results()
    private(set) var result: Float = 0
    
    private init () { }

    func setResult(r: Float) {
        self.result = r
    }
}
