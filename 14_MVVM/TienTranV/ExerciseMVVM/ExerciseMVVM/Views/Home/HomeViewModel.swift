//
//  HomeViewModel.swift
//  ExerciseMVVM
//
//  Created by PCI0002 on 12/13/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import Foundation

final class HomeViewModel {

    private var datas: [[Location]] = [DummyData.slidesImage, DummyData.locations]

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
}

extension HomeViewModel {
    struct DummyData {
        static var slidesImage: [Location] = {
            let slides = [Location(name: "Coffe Lu Lu", address: "Hoà Xuân, Đà Nẵng", imageName: "hinglands-coffee"),
                Location(name: "Coffe Cóc", address: "Hoà Xuân, Đà Nẵng", imageName: "hoahong"),
                Location(name: "Coffe Lu Lu", address: "Hoà Xuân, Đà Nẵng", imageName: "hinglands-coffee"),
                Location(name: "Coffe Cóc", address: "Hoà Xuân, Đà Nẵng", imageName: "hinglands-coffee"),
                Location(name: "Coffe Lu Lu", address: "Hoà Xuân, Đà Nẵng", imageName: "hinglands-coffee"),
                Location(name: "Coffe Cóc", address: "Hoà Xuân, Đà Nẵng", imageName: "hoahong"),
                Location(name: "Coffe Cóc", address: "Hoà Xuân, Đà Nẵng", imageName: "hoahong")]
            return slides
        }()

        static var locations: [Location] = {
            let locations = [Location(name: "Coffe Lu Lu", address: "Hoà Xuân, Đà Nẵng", imageName: "hinglands-coffee"),
                Location(name: "Coffe Cóc", address: "Hoà Xuân, Đà Nẵng", imageName: "hinglands-coffee"),
                Location(name: "Coffe Lu Lu", address: "Hoà Xuân, Đà Nẵng", imageName: "hoahong"),
                Location(name: "Coffe Cóc", address: "Hoà Xuân, Đà Nẵng", imageName: "hoahong"),
                Location(name: "Coffe Lu Lu", address: "Hoà Xuân, Đà Nẵng", imageName: "hinglands-coffee"),
                Location(name: "Coffe Cóc", address: "Hoà Xuân, Đà Nẵng", imageName: "hoahong"), Location(name: "Coffe Lu Lu", address: "Hoà Xuân, Đà Nẵng", imageName: "hinglands-coffee"),
                Location(name: "Coffe Cóc", address: "Hoà Xuân, Đà Nẵng", imageName: "hinglands-coffee"),
                Location(name: "Coffe Lu Lu", address: "Hoà Xuân, Đà Nẵng", imageName: "hoahong"),
                Location(name: "Coffe Cóc", address: "Hoà Xuân, Đà Nẵng", imageName: "hoahong"),
                Location(name: "Coffe Lu Lu", address: "Hoà Xuân, Đà Nẵng", imageName: "hinglands-coffee"),
                Location(name: "Coffe Cóc", address: "Hoà Xuân, Đà Nẵng", imageName: "hinglands-coffee")]
            return locations
        }()
    }
}
