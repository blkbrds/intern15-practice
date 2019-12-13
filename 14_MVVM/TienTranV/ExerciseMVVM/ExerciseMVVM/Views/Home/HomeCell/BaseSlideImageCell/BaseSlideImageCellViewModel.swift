//
//  BaseSlideImageCellViewModel.swift
//  ExerciseMVVM
//
//  Created by PCI0002 on 12/13/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import Foundation

final class BaseSlideImageCellViewModel {

    var locations: [Location]
    
    init(locations: [Location] = []) {
        self.locations = locations
    }
    
    func numberOfItems() -> Int {
         return locations.count
     }

     func getImageName(with indexPath: IndexPath) -> String {
         return locations[indexPath.row].imageName
     }
}
