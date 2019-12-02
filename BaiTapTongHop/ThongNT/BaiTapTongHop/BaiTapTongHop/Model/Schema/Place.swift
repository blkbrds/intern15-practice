//
//  Place.swift
//  BaiTapTongHop
//
//  Created by PCI0018 on 11/25/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import Foundation

final class Place {

    var title: String
    var address: String
    var rating: String
    var distance: String
    var favorite: Bool

    init(title: String, address: String, rating: Int, distance: Float, favorite: Bool) {
        self.title = title
        self.address = address
        self.rating = "\(rating)/10"
        self.distance = "\(distance) km"
        self.favorite = favorite
    }

    static var places: [Place] = [Place(title: "Nhà của Phước", address: "183 Nguyễn Lương Bằng", rating: 9, distance: 10, favorite: true),
        Place(title: "Nhà của Thông", address: "183 Nguyễn Lương Bằng", rating: 9, distance: 10, favorite: false),
        Place(title: "Nhà của Duy", address: "183 Nguyễn Lương Bằng", rating: 9, distance: 10, favorite: false),
        Place(title: "Nhà của Hạnh", address: "183 Nguyễn Lương Bằng", rating: 9, distance: 10, favorite: true),
        Place(title: "Nhà của Viên", address: "183 Nguyễn Lương Bằng", rating: 9, distance: 10, favorite: false),
        Place(title: "Nhà của Hùng", address: "183 Nguyễn Lương Bằng", rating: 9, distance: 10, favorite: false),
        Place(title: "Nhà của Pi", address: "183 Nguyễn Lương Bằng", rating: 9, distance: 10, favorite: false),
        Place(title: "Nhà của Tim Cook", address: "183 Nguyễn Lương Bằng", rating: 9, distance: 10, favorite: false)]
}
