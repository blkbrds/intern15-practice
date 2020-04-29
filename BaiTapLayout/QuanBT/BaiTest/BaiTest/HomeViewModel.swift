//
//  HomeViewModel.swift
//  BaiTest
//
//  Created by Sếp Quân on 4/29/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import Foundation

final class HomeViewModel {
    // MARK: - Properties
    var datas: [DataTest] = []
    
    // MARK: - Function
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
        let data1 = DataTest(name: "Nguyễn Văn A", tieusu: "Tiểu sử là Tiểu sử là Tiểu sử là Tiểu sử là", diachi: "Hải Châu, Đà Nẵng, Hải Châu, Đà Nẵng, Hải Châu, Đà Nẵng", gioitinh: "Nam", ngay: "09-09-2009", image: "img-avatar")
        let data2 = DataTest(name: "Nguyễn Văn B", tieusu: "Tiểu sử là Tiểu sử là Tiểu sử là Tiểu sử là", diachi: "Hải Châu, Đà Nẵng, Hải Châu, Đà Nẵng, Hải Châu, Đà Nẵng", gioitinh: "Nam", ngay: "09-09-2009", image: "img-avatar")
        let data3 = DataTest(name: "Nguyễn Văn C", tieusu: "Tiểu sử là Tiểu sử là Tiểu sử là Tiểu sử là", diachi: "Hải Châu, Đà Nẵng, Hải Châu, Đà Nẵng, Hải Châu, Đà Nẵng", gioitinh: "Nam", ngay: "09-09-2009", image: "img-avatar")
        let data4 = DataTest(name: "Nguyễn Văn D", tieusu: "Tiểu sử là Tiểu sử là Tiểu sử là Tiểu sử là", diachi: "Hải Châu, Đà Nẵng, Hải Châu, Đà Nẵng, Hải Châu, Đà Nẵng, Hải Châu, Đà Nẵng, Hải Châu, Đà Nẵng, Hải Châu, Đà Nẵng", gioitinh: "Nam", ngay: "09-09-2009", image: "img-avatar")
        let data5 = DataTest(name: "Nguyễn Văn E", tieusu: "Tiểu sử là Tiểu sử là Tiểu sử là Tiểu sử là", diachi: "Hải Châu, Đà Nẵng", gioitinh: "Nam", ngay: "09-09-2009", image: "img-avatar")
        self.datas.append(contentsOf: [data1, data2, data3, data4, data5])
    }
}
