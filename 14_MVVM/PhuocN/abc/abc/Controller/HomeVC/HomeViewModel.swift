//
//  HomeViewModel.swift
//  abc
//
//  Created by PhuocNguyen on 10/23/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import Foundation

class HomeViewModel {
    private(set) var data: [Location] = [Location(name: "Coffee 1", avatar: "Coffee 1", address: "1 Bach Dang", distance: "3 km", rates: "8/10", isFavorite: false),
                                         Location(name: "Coffee 2", avatar: "Coffee 2", address: "1 Bach Dang", distance: "3 km", rates: "8/10", isFavorite: false),
                                         Location(name: "Coffee 3", avatar: "Coffee 3", address: "1 Bach Dang", distance: "3 km", rates: "8/10", isFavorite: true),
                                         Location(name: "Coffee 4", avatar: "Coffee 4", address: "1 Bach Dang", distance: "3 km", rates: "8/10", isFavorite: false),
                                         Location(name: "Coffee 5", avatar: "Coffee 5", address: "1 Bach Dang", distance: "3 km", rates: "8/10", isFavorite: false),
                                         Location(name: "Coffee 6", avatar: "Coffee 6", address: "1 Bach Dang", distance: "3 km", rates: "8/10", isFavorite: false),
                                         Location(name: "Coffee 7", avatar: "Coffee 7", address: "1 Bach Dang", distance: "3 km", rates: "8/10", isFavorite: true),
                                         Location(name: "Coffee 8", avatar: "Coffee 8", address: "1 Bach Dang", distance: "3 km", rates: "8/10", isFavorite: false),
                                         Location(name: "Coffee 9", avatar: "Coffee 9", address: "1 Bach Dang", distance: "3 km", rates: "8/10", isFavorite: false),
                                         Location(name: "Coffee 10", avatar:"Coffee 10", address: "1 Bach Dang", distance: "3 km", rates: "8/10", isFavorite: true)]
    
    private(set) var slideImages = ["Coffee 1", "Coffee 2", "Coffee 3", "Coffee 4", "Coffee 5"]
    
    func clickButton(name: String) {
        print("View Model --> name: \(name)")
    }
    
    func getItemAtIndexPath(_ indexPath: IndexPath) -> Location {
        return data[indexPath.row]
    }
    
    func deleteItemAtIndexPath(_ indexPath: IndexPath, completion: (Bool) -> ()) {
        if indexPath.row < data.count {
            data.remove(at: indexPath.row)
            print("Delete item at: \(indexPath)")
            completion(true)
        } else {
            completion(false)
        }
    }
}
