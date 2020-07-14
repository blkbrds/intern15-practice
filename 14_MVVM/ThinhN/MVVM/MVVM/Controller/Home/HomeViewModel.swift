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
    
    var listCafes: [CoffeeShop] = [CoffeeShop(title: "Danang Souvenirs & Cafe", address: "34 Bạch Đằng, Hải Châu, Đà Nẵng ", rating: 9, distance: 3, imageName: "souvernir"), CoffeeShop(title: "The Long Bar ", address: "Thọ Quang, Sơn Trà, Da Nang", rating: 10, distance: 5.6, imageName: "longbar"), CoffeeShop(title: "Cloud Garden Coffee shop", address: "72 Lê Mạnh Trinh, Sơn Trà, Đà Nẵng", rating: 9, distance: 3.5, imageName: "cloudgarden"), CoffeeShop(title: "ADOR - Coffee & Bottle", address: "17 Phan Thành Tài, Hải Châu, Đà Nẵng", rating: 8, distance: 2, imageName: "ador"), CoffeeShop(title: "Cộng Cà Phê", address: "98-96 Bạch Đằng, Đà Nẵng", rating: 8, distance: 4, imageName: "images")]
    
    func numberOfRowsInSection() -> Int {
        return listCafes.count
    }
    
    func viewModelForCellAt(indexPath: IndexPath) -> HomeCellViewModel {
        let item = listCafes[indexPath.row]
        let viewModel = HomeCellViewModel(cafe: item)
        return viewModel
    }
}
