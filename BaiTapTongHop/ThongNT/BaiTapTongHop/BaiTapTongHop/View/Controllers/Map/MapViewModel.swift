//
//  MapViewModel.swift
//  BaiTapTongHop
//
//  Created by PCI0018 on 12/20/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import Foundation
import MVVM

final class MapViewModel: ViewModel {
    var markers: [Marker] = [Marker(title: "Nhà", snippet: "Đây là nhà", lat: 16.345345 , long: 142.23423),
                             Marker(title: "Nhà", snippet: "Đây là nhà", lat: 16.345345 , long: 141.23423),
                             Marker(title: "Nhà", snippet: "Đây là nhà", lat: 16.345345 , long: 143.23423),
                             Marker(title: "Nhà", snippet: "Đây là nhà", lat: 16.345345 , long: 145.23423),
                             Marker(title: "Nhà", snippet: "Đây là nhà", lat: 16.345345 , long: 144.23423)]
    
    func getMarker() -> Marker {
        return Marker()
    }
}
