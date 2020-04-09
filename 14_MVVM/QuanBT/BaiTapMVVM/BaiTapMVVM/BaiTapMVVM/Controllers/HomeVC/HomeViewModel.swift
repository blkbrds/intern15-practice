//
//  HomeViewModel.swift
//  BaiTapMVVM
//
//  Created by Sếp Quân on 4/9/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import Foundation

final class HomeViewModel {
    // MARK: - Properties
    var datas: [DataManager] = []
    
    // MARK: - Function
    func numberOfSection() -> Int {
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
        let data1 = DataManager(name: " Danang Souvenirs & Cafe", image: "image1", address: "34 Bạch Đằng, Hải Châu, Đà Nẵng", range: "2km", rate: "9/10")
        let data2 = DataManager(name: " Cộng Cà Phê", image: "image2", address: "98-96 Bạch Đằng, Hải Châu, Đà Nẵng", range: "4km", rate: "8/10")
        let data3 = DataManager(name: "Cafe Nia", image: "image3", address: " 3 Phan Thành Tài, Hải Châu, Đà Nẵng", range: "3km", rate: "10/10")
        let data4 = DataManager(name: "Aroi Dessert Cafe", image: "image4", address: "124 Bạch Đằng, Hải Châu, Đà Nẵng", range: "5km", rate: "9/10")
        let data5 = DataManager(name: "Time Coffee", image: "image5", address: "509 Trần Hưng Đạo, Sơn Trà, Đà Nẵng", range: "10km", rate: "8/10")
        self.datas.append(contentsOf: [data1, data2, data3, data4, data5])
    }
}
