//
//  HomeViewModel.swift
//  BaiTapTongHop
//
//  Created by PCI0018 on 11/25/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import Foundation
import MVVM
import RealmSwift

final class HomeViewModel: ViewModel {

    // MARK: - Properties
    var offset: Int = 0
    var places: [GooglePlace] = []
    var currentIndex: Int = 0
    var imageDict: [String: [String]] = [:]
//    var favoriteRealm = Favorites()

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
                if additionPlaces.places.isEmpty {
                    completed(false, "")
                } else {
                    self.places.append(contentsOf: additionPlaces.places)
                    completed(true, "")
                }
            }
        }
    }

    func loadPlaceImageURLs(completed: @escaping (Bool, String) -> Void) {
        for place in places {
            ApiManager.Places.getPlaceImages(idPlace: place.idPlace) { (result) in
                switch result {
                case .failure(let error):
                    completed(false, error.localizedDescription)
                case .success(let imageStrings):
                    self.imageDict["\(place.idPlace)"] = imageStrings.imageStrings
                    completed(true, "")
                }
            }
        }
    }
}

extension HomeViewModel {

    func getNumberOfPlaces() -> Int {
        return places.count
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

    func getImageURLs(with idPlace: String) -> [String] {
        for place in places {
            if place.idPlace == idPlace {
                if let imageStrings = imageDict["\(idPlace)"] {
                    return imageStrings
                }
            }
        }
        return [""]
    }

    func getPlaceID(with index: Int) -> String {
        return places[index].idPlace
    }

    func getPlaces() -> [GooglePlace] {
        return places
    }
}
