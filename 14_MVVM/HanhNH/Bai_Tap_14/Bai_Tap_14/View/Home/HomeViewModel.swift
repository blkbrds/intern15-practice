//
//  HomeViewModel.swift
//  Bai_Tap_14
//
//  Created by ANH NGUYỄN on 12/9/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import Foundation
class HomeViewModel {
    
    //poperties
    var address: [Address] = []
    var images: [ImageSlider] = []
    var isShowTableView: Bool = true
    
    //request
    func loadData(completion: (Bool) -> ()) {
        //dummydata
        address = Address.getDummyDatas()
        
        //call back
        completion(true)
    }
    
    //actions
    func changeDisplay(completion: (Bool) -> ()) {
        //data
        isShowTableView = !isShowTableView
        //call back
        completion(true)
    }
    //lay IndexPath
    func getHomeCellModel(atIndexPath indexPath: IndexPath) -> HomeCellTabelViewModel? {
        guard indexPath.row < address.count else { return nil }
        return HomeCellTabelViewModel(address: address[indexPath.row])
    }
}
