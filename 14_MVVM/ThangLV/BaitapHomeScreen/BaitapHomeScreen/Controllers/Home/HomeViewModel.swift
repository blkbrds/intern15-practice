//
//  HomeViewModel.swift
//  BaitapHomeScreen
//
//  Created by PCI0008 on 2/5/20.
//  Copyright © 2020 PCI0008. All rights reserved.
//

import Foundation

final class HomeViewModel {
    var imageNames: [String] = ["Cho", "Nai", "Soc", "Voi", "Vuon"]
    var homes: [Home] = [Home(imageName: "a", name: "", address: "", rating: "", distance: "", isLiked: false),
                         Home(imageName: "a", name: "", address: "", rating: "", distance: "", isLiked: true),
                         Home(imageName: "a", name: "", address: "", rating: "", distance: "", isLiked: false),
                         Home(imageName: "a", name: "", address: "", rating: "", distance: "", isLiked: true),
                         Home(imageName: "a", name: "", address: "", rating: "", distance: "", isLiked: false),
                         Home(imageName: "a", name: "", address: "", rating: "", distance: "", isLiked: false),
                         Home(imageName: "a", name: "", address: "", rating: "", distance: "9km", isLiked: true)]
    
    func numberOfItems() -> Int {
        return homes.count
    }
    
    func viewModelForItem(at indexPath: IndexPath) -> CustomCellViewModel {
        let homeObject = homes[indexPath.row]
        return CustomCellViewModel(home: homeObject)
    }
}
