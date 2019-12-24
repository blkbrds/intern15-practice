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
    
    // MARK: - Properties
    var offset: Int = 0
    var places: [GooglePlace] = []
    var currentIndex: Int = 0
    
    // MARK: - Load data from API
    func loadPlaceData(completed: @escaping (Bool, String) -> Void) {
        offset = 0
        ApiManager.Places.getGooglePlace() { (result) in
            switch result {
            case .failure(let error):
                completed(false, error.localizedDescription)
            case .success(let places):
                self.places = places.places
                completed(true, "")
            }
        }
    }
    
    func loadMore(completed: @escaping (Bool, String) -> Void) {
        offset += 20
        ApiManager.Places.getGooglePlace(limit: 20, offSet: self.offset) { (result) in
            switch result {
            case .failure(let error):
                completed(false, error.localizedDescription)
            case .success(let additionPlaces):
                self.places.append(contentsOf: additionPlaces.places)
                completed(true, "")
            }
        }
    }
}

extension HomeViewModel {
    
    func getNumberOfPlaces() -> Int {
        return places.count
    }
    
    func changeFavorite(at index: Int, completion: (Bool, String) -> ()) {
        if index > places.count - 1 {
            completion(false, "Khong the like duoc")
        } else {
            places[index].favorite = !places[index].favorite
            completion(true, "")
        }
    }
    
    func getDetailViewModel(indexPath: IndexPath) -> DetailViewModel {
        currentIndex = indexPath.row
        return DetailViewModel(googlePlace: places[indexPath.row])
    }
    
    func getHomeCellViewModel(indexPath: IndexPath) -> HomeCellViewModel {
        return HomeCellViewModel(googlePlace: places[indexPath.row])
    }
    
    func removePlace(at indexPath: IndexPath) {
        places.remove(at: indexPath.row)
    }
}
