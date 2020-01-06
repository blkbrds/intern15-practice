//
//  FavoritesViewModel.swift
//  BaiTapTongHop
//
//  Created by PCI0018 on 12/28/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import Foundation

final class FavoritesViewModel {

    private var favoritedPlaces: [GooglePlace] = []
    private var places: [Favorites] = []
}

// MARK: - Function
extension FavoritesViewModel {

    func getFavoritedPlace(isRefresh: Bool, completed: () -> Void) {
        if isRefresh {
            favoritedPlaces.removeAll()
        }
        places = RealmManager.shared.getObjectsFromRealm()
        convert()
        completed()
    }

    func convert() {
        for place in places {
            let googlePlace = GooglePlace(idPlace: place.idPlace, name: place.name, rating: place.rating, address: place.address, distance: place.distance, iconString: place.iconString)
            favoritedPlaces.append(googlePlace)
        }
    }

    func getNumberOfFavoritedPlace() -> Int {
        return favoritedPlaces.count
    }

    func getFavoritesCellViewModel(indexPath: IndexPath) -> HomeCellViewModel {
        return HomeCellViewModel(googlePlace: favoritedPlaces[indexPath.row])
    }

    func getDetailViewModel(indexPath: IndexPath) -> DetailViewModel {
        return DetailViewModel(googlePlace: favoritedPlaces[indexPath.row])
    }

    func removePlace(indexPath: IndexPath, completion: @escaping (Bool, String) -> Void) {
        RealmManager.shared.deletaPlace(idPlace: favoritedPlaces[indexPath.row].idPlace) { (result) in
            switch result {
            case .failure(let error):
                completion(false, error)
            case .success:
                completion(true, "")
            }
        }
    }

    func removeAll(completion: @escaping (Bool, String) -> Void) {
        RealmManager.shared.deleteAll { (result) in
            switch result {
            case .failure(let error):
                completion(false, error)
            case .success:
                completion(true, "")
            }
        }
    }
}
