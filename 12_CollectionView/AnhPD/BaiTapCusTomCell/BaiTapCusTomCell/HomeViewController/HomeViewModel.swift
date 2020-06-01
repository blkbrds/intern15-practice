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
    var dataCollectionCafes: [HomeCollectionCellViewModel] = []
    
    func getDataCafes() {
        guard let path = Bundle.main.url(forResource: "Sections", withExtension: "plist"), let sectionsData = NSDictionary(contentsOf: path) else {
            return
        }
        
        if let caffes = sectionsData["Caffes"] as? [[String: Any]] {
            var homeCellVMs: [HomeCellVM] = []
            var homeCollectionCellVMs: [HomeCollectionCellViewModel] = []
            
            caffes.forEach { caffe in
                let avatarName: String = caffe["avatarName"] as? String ?? ""
                let nameTitle: String = caffe["nameTitle"] as? String ?? ""
                let address: String = caffe["address"] as? String ?? ""
                let homeCellVM = HomeCellVM(avatarName: avatarName, nameTiltle: nameTitle, address: address)
                let homeCollectionVM = HomeCollectionCellViewModel(nameTitle: nameTitle, avatarName: avatarName, address: address)
                homeCellVMs.append(homeCellVM)
                homeCollectionCellVMs.append(homeCollectionVM)
            }
            dataCafes.append(contentsOf: homeCellVMs)
            dataCollectionCafes.append(contentsOf: homeCollectionCellVMs)
        }
    }
    
    func numberOfRowInSectionCafes() -> Int {
        return dataCafes.count
    }
    
    func viewModelCellForRow(at indexPath: IndexPath) -> HomeCellVM {
        let item = dataCafes[indexPath.row]
        let viewModel = HomeCellVM(avatarName: item.avatarName, nameTiltle: item.nameTitle, address: item.address)
        return viewModel
    }
    
    func viewModelCellForItem(at indexPath: IndexPath) -> HomeCollectionCellViewModel {
        let item = dataCollectionCafes[indexPath.row]
        let viewModel = HomeCollectionCellViewModel(nameTitle: item.nameTitle, avatarName: item.avatarName, address: item.address)
        return viewModel
    }
}
