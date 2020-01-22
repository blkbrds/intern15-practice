//
//  Place.swift
//  MVVM
//
//  Created by user on 1/22/20.
//  Copyright © 2020 VienH. All rights reserved.
//

import Foundation

final class Place {
    var name: String
    var address: String
    var imageName: String
    var rate: String
    var distance: String
    var favorites: Bool

    init(name: String, address: String, imageName: String, rate: String = "8/10", distance: String = "8km", favorites: Bool = false) {
        self.name = name
        self.address = address
        self.imageName = imageName
        self.rate = rate
        self.distance = distance
        self.favorites = favorites
    }
}

extension Place {
    struct DummyData {
        static var slidesImage: [Place] = {
            let slides = [Place(name: "Coffee House", address: "Liên Chiểu, Đà Nẵng", imageName: "house-coffee"),
                Place(name: "Hingland Coffee", address: "Liên Chiểu, Đà Nẵng", imageName: "house-coffee"),
                Place(name: "Coffee House", address: "Liên Chiểu, Đà Nẵng", imageName: "hinglands-coffee"),
                Place(name: "Hingland Coffee", address: "Liên Chiểu, Đà Nẵng", imageName: "house-coffee"),
                Place(name: "Coffee House", address: "Liên Chiểu, Đà Nẵng", imageName: "hinglands-coffee"),
                Place(name: "Hingland Coffee", address: "Liên Chiểu, Đà Nẵng", imageName: "house-coffee"),
                Place(name: "Hingland Coffee", address: "Liên Chiểu, Đà Nẵng", imageName: "hinglands-coffee")]
            return slides
        }()

        static var places: [Place] = {
            let places = [Place(name: "Coffee House", address: "Liên Chiểu, Đà Nẵng", imageName: "house-coffee"),
                Place(name: "Hingland Coffee", address: "Liên Chiểu, Đà Nẵng", imageName: "house-coffee"),
                Place(name: "Coffe House", address: "Liên Chiểu, Đà Nẵng", imageName: "house-coffee"),
                Place(name: "Hingland Coffee", address: "Liên Chiểu, Đà Nẵng", imageName: "house-coffee"),
                Place(name: "Coffe House", address: "Liên Chiểu, Đà Nẵng", imageName: "house-coffee"),
                Place(name: "Hingland Coffee", address: "Liên Chiểu, Đà Nẵng", imageName: "house-coffee"), Place(name: "Coffe House", address: "Liên Chiểu, Đà Nẵng", imageName: "house-coffee"),
                Place(name: "Hingland Coffee", address: "Liên Chiểu, Đà Nẵng", imageName: "house-coffee"),
                Place(name: "Coffe House", address: "Liên Chiểu, Đà Nẵng", imageName: "house-coffee"),
                Place(name: "Hingland Coffee", address: "Liên Chiểu, Đà Nẵng", imageName: "house-coffee"),
                Place(name: "Coffe House", address: "Liên Chiểu, Đà Nẵng", imageName: "house-coffee"),
                Place(name: "Hingland Coffee", address: "Liên Chiểu, Đà Nẵng", imageName: "house-coffee")]
            return places
        }()
    }
}
