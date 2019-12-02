//
//  HomeViewModel.swift
//  BaiTapTongHop
//
//  Created by PCI0018 on 11/25/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import Foundation
import MVVM

final class HomeViewModel: ViewModel {
    
    var searchPlaces: [Place] = []
    
//    func search(keyword: String) {
//        searchPlaces = getPlaces(keyword: keyword)
//    }
    
    func getPlaces(by keyword: String) -> [String] {
        return [""]
    }
    
    func getNumberOfPlaces() -> Int {
        Place.places.count
    }
    
    func changeFavorite(at index: Int, completion: (Bool, String) -> ()) {
        if index > Place.places.count - 1 {
            completion(false, "Khong the like duoc")
        } else {
            Place.places[index].favorite = !Place.places[index].favorite
            completion(true, "")
        }
    }
    
    func getDetailViewModel() -> DetailViewModel {
        return DetailViewModel(name: "Thong")
    }
    
    func getHomeCellViewModel(indexPath: IndexPath) -> HomeCellViewModel {
        return HomeCellViewModel(place: Place.places[indexPath.row])
    }
}
