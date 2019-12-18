//
//  HomeViewModel.swift
//  ExerciseMVVM
//
//  Created by PCI0002 on 12/13/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import Foundation

final class HomeViewModel {

    private var datas: [[Location]] = []
    typealias Completion = (Bool, String) -> Void

    func fetchData(completion: Completion) {
        datas.append(Location.DummyData.slidesImage)
        datas.append(Location.DummyData.locations)
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

    func getLocations(with indexPath: IndexPath) -> [Location] {
        return datas[indexPath.section]
    }

    func getLocation(with indexPath: IndexPath) -> Location {
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
