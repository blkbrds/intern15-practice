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

    func getNumberOfItems(in section: Int) -> Int {
        if section == 0 { return 1 }
        else {
            return datas[section].count
        }
    }

    func getPlace(with indexPath: IndexPath) -> [Place] {
        return datas[indexPath.section]
    }

    func getPlaces(with indexPath: IndexPath) -> Place {
        return datas[indexPath.section][indexPath.row]
    }

    func changeFavorites(with indexPath: IndexPath, completion: Completion) {
        if indexPath.row >= datas[indexPath.section].count {
            completion(false, "Error")
        } else {
            datas[indexPath.section][indexPath.row].favorites = !datas[indexPath.section][indexPath.row].favorites
            completion(true, "")
        }
    }
}
