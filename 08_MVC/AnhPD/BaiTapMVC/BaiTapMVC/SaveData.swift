//
//  Storage.swift
//  BaiTapMVC
//
//  Created by PCI0012 on 4/23/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import Foundation

class SaveData {
    var number: Float = 0
    var numbers: [Float] = []
    
    func addNumber(number: Float) -> Float {
        if self.number * 10 + number < 99999 {
            self.number = self.number * 10 + number
        }
        return self.number
    }
}
