
//
//  HomeViewModel.swift
//  BaiTapMVVM
//
//  Created by PCI0012 on 6/2/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import Foundation

class HomeViewModel {
    
    var cafes: [Cafe] = []
    
    func loadCafe() {
        guard let path = Bundle.main.url(forResource: "Sections", withExtension: "plist"), let sectionsCafe = NSDictionary(contentsOf: path) else {
            return
        }
        if let sectionsCafe = sectionsCafe["Cafes"] as? [[String: Any]] {
            var cafes: [Cafe] = []
            sectionsCafe.forEach { item in
                let avatarName: String = item["avatarName"] as! String
                let nameTitle: String = item["nameTitle"] as! String
                let address: String = item["address"] as! String
                let km: String = item["km"] as! String
                let cafe = Cafe(avatarName: avatarName, nameTitle: nameTitle, address: address, km: km)
                cafes.append(cafe)
            }
            self.cafes.append(contentsOf: cafes)
        }
    }
    
    func numberOfRowsInSection() -> Int {
        return cafes.count
    }
    
    func viewModelCellForRowAt(indexPath: IndexPath) -> HomeCellViewModel {
        let item = cafes[indexPath.row]
        let viewModel = HomeCellViewModel(cafe: item)
        return viewModel
    }
}
