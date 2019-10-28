//
//  HomeViewModel.swift
//  abc
//
//  Created by PhuocNguyen on 10/23/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import Foundation

class HomeViewModel {
    
    var places: [Place] = []
    var numberOfSection: Int = 2
    var slideImages = ["Coffee 1", "Coffee 2", "Coffee 3", "Coffee 4", "Coffee 5"]
    
    func loadData(completion: (String, Bool) -> ()) {
        self.places = Place.places
        completion("Sucessfully", true)
    }
    
    func clickButton(name: String) {
        print("View Model --> name: \(name)")
    }
    
    func getItemAtIndexPath(_ indexPath: IndexPath) -> Place {
        return places[indexPath.row]
    }
    
    func getSlideImage() -> [String] {
        return slideImages
    }
    
    func deleteItemAtIndexPath(_ indexPath: IndexPath, completion: (Bool) -> ()) {
        if indexPath.row < places.count {
            places.remove(at: indexPath.row)
            print("Delete item at: \(indexPath)")
            completion(true)
        } else {
            completion(false)
        }
    }
    
    func numberRowOfSection(at section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return places.count
    }
    
    func likePlace(at index: Int) {
        places[index].isFavorite = !places[index].isFavorite
    }
}
