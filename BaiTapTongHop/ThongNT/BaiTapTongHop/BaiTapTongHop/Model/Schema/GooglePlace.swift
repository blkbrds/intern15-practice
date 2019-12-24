//
//  GooglePlace.swift
//  BaiTapTongHop
//
//  Created by PCI0018 on 12/5/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import UIKit

final class GooglePlace {
    var idPlace: String = ""
    var name: String = ""
    var address: String = ""
    var rating: Double = 0
    var distance: Int = 0
    var favorite: Bool = false
    var formattedAddress: [String] = []
    var thumbnailImage: UIImage?
    var categories: [[String: Any]] = [[:]]
    var iconString: String = ""

    init() { }

    init(from dict: [String: Any]) {
        idPlace = dict["id"] as? String ?? ""
        name = dict["name"] as? String ?? ""
        formattedAddress = dict["address"] as? [String] ?? []
        distance = dict["distance"] as? Int ?? 0
        rating = dict["rating"] as? Double ?? 0
        categories = dict["categories"] as? [[String: Any]] ?? [[:]]
        converData()
    }

    private func converData() {
        formattedAddress.forEach { (item) in
            address += item
        }

        for category in categories {
            let icon = category["icon"] as? [String: Any] ?? [:]
            let prefix = icon["prefix"] as? String ?? ""
            let suffix = icon["suffix"] as? String ?? ""
            iconString = prefix + "88" + suffix
        }
    }
}