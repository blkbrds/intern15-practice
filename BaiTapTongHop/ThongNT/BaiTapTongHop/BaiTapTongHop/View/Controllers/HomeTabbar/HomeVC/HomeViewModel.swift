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
    
    func getNumberOfPlaces() -> Int {
        Place.places.count
    }
    
    func getPlace(at index: Int) -> Place {
        return Place.places[index]
    }
    
    func changeFavorite(at index: Int, completion: (Bool, String) -> ()) {
        if index > Place.places.count - 1 {
            completion(false, "Khong the like duoc")
        } else {
            Place.places[index].favorite = !Place.places[index].favorite
            completion(true, "")
        }
    }
}
