//
//  BaseSlideImageCellViewModel.swift
//  MVVM
//
//  Created by user on 2/5/20.
//  Copyright © 2020 VienH. All rights reserved.
//

import Foundation

final class BaseSlideImageCellViewModel {

    var places: [Place]

    init(places: [Place] = []) {
        self.places = places
    }

    func numberOfItem() -> Int {
        return places.count
    }

    func getImageName(with indexPath: IndexPath) -> String {
        return places[indexPath.row].imageName
    }
}
