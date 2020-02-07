//
//  DetailViewModel.swift
//  BaitapHomeScreen
//
//  Created by PCI0008 on 2/6/20.
//  Copyright © 2020 PCI0008. All rights reserved.
//

import Foundation

final class DetailViewModel {
    
    var images: [String] = ["Cho", "Nai", "Soc", "Voi", "Vuon"]
    
    init() { }
    
    init(images: [String]) {
        self.images = images
    }
}
