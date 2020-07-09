//
//  ViewModel.swift
//  MVVM
//
//  Created by PCI0019 on 7/7/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation
import UIKit

class HomeViewModel {
    
    var listCaffe: [Caffee] = [Caffee(title: "Danang Souvenirs & Cafe", address: "34 Bạch Đằng, Hải Châu, Đà Nẵng ", rating: "9/10", distance: "3km", imageName: "souvernir"), Caffee(title: "The Long Bar ", address: "Thọ Quang, Sơn Trà, Da Nang", rating: "10/10", distance: "5km", imageName: "longbar"), Caffee(title: "Cloud Garden Coffee shop", address: "72 Lê Mạnh Trinh, Sơn Trà, Đà Nẵng", rating: "8/10", distance: "4km", imageName: "cloudgarden"), Caffee(title: "ADOR - Coffee & Bottle", address: "17 Phan Thành Tài, Hải Châu, Đà Nẵng", rating: "8/10", distance: "2km", imageName: "ador"), Caffee(title: "Cộng Cà Phê", address: "98-96 Bạch Đằng, Đà Nẵng", rating: "9/10", distance: "4km", imageName: "images")]
    
    func numberOfRowsInSection() -> Int {
        return listCaffe.count
    }
    
    func cellForRowAt(indexPath: IndexPath) -> HomeCellViewModel {
        let item = listCaffe[indexPath.row]
        let viewModel = HomeCellViewModel(caffee: item)
        return viewModel
    }
}
