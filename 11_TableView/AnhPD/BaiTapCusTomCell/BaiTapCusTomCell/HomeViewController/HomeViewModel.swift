//
//  HomeViewModel.swift
//  BaiTapCusTomCell
//
//  Created by PCI0012 on 5/22/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import Foundation

final class HomeViewModel {
    var dataCafes: [HomeCellVM] = []
    
    func getDataCafes() {
        guard let path = Bundle.main.url(forResource: "Sections", withExtension: "plist"), let sectionsData = NSDictionary(contentsOf: path) else {
            return
        }
        
        if let caffes = sectionsData["Caffes"] as? [[String: Any]] {
            var homeCellVMs: [HomeCellVM] = []
            caffes.forEach { caffe in
                let avatarName: String = caffe["avatarName"] as? String ?? ""
                let nameTitle: String = caffe["nameTitle"] as? String ?? ""
                let address: String = caffe["address"] as? String ?? ""
                let homeCellVM = HomeCellVM(avatarName: avatarName, nameTiltle: nameTitle, address: address)
                homeCellVMs.append(homeCellVM)
            }
            dataCafes.append(contentsOf: homeCellVMs)
        }
    }
    
    func numberOfRowInSectionCafes() -> Int {
        return dataCafes.count
    }
    
    func viewModelForCellCafes(at indexPath: IndexPath) -> HomeCellVM {
        let item = dataCafes[indexPath.row]
        let viewModel = HomeCellVM(avatarName: item.avatarName, nameTiltle: item.nameTitle, address: item.address)
        return viewModel
    }
}
