//
//  HomeViewModel.swift
//  MVVM
//
//  Created by user on 1/22/20.
//  Copyright © 2020 VienH. All rights reserved.
//

import Foundation

final class HomeViewModel {

    private var datas: [[Place]] = []
    typealias Completion = (Bool, String) -> Void

    func fetchData(completion: Completion) {
        datas.append(Place.DummyData.slidesImage)
        datas.append(Place.DummyData.places)
        completion(true, "")
    }

    func getNumberOfSection() -> Int {
        return datas.count
    }

    func getNumberOfItems(_ section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return datas[section].count
        }
    }

    func getLocations(with indexPath: IndexPath) -> [Place] {
        return datas[indexPath.section]
    }

    func getLocation(with indexPath: IndexPath) -> Place {
        return datas[indexPath.section][indexPath.row]
    }

    func changeFavorites(with indexPath: IndexPath, completion: Completion) {
        if indexPath.row >= datas[indexPath.section].count {
            completion(false, "Over of range")
        } else {
            datas[indexPath.section][indexPath.row].favorites = !datas[indexPath.section][indexPath.row].favorites
            completion(true, "")
        }
    }
}
