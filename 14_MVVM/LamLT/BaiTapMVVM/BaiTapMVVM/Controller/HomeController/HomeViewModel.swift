//
//  HomeViewModel.swift
//  BaiTapMVVM
//
//  Created by PCI0002 on 4/16/20.
//  Copyright © 2020 LeThanhLam. All rights reserved.
//

import Foundation

enum Status {
    case tableView
    case collectionView
}

final class HomeViewModel {

    var datas: [DataManager] = []
    let images = ["image1", "image2", "image3", "image4", "image5"]

    func numberOfSections() -> Int {
        return 2
    }

    func numberOfRowInSection() -> Int {
        return datas.count
    }

    func viewModelForCell(at indexPath: IndexPath) -> HomeCellModel {
        let item = datas[indexPath.row]
        let viewModel = HomeCellModel(data: item)
        return viewModel
    }

    func getData() {
        let data1 = DataManager(name: "Garden Cafe", image: "image1", address: "1 Bạch Đằng, Hải Châu, Đà Nẵng", range: "2km", rate: "9/10", favorite: true)
        let data2 = DataManager(name: "Heaven Cafe", image: "image2", address: "2 Bạch Đằng, Hải Châu, Đà Nẵng", range: "4km", rate: "8/10")
        let data3 = DataManager(name: "Hell Cafe", image: "image3", address: "3 Bạch Đằng, Hải Châu, Đà Nẵng", range: "3km", rate: "10/10")
        let data4 = DataManager(name: "Beach Cafe", image: "image4", address: "4 Bạch Đằng, Hải Châu, Đà Nẵng", range: "5km", rate: "9/10")
        let data5 = DataManager(name: "Moutain Cafe", image: "image5", address: "54 Bạch Đằng, Hải Châu, Đà Nẵng", range: "10km", rate: "8/10")
        self.datas.append(contentsOf: [data1, data2, data3, data4, data5])
    }
}
