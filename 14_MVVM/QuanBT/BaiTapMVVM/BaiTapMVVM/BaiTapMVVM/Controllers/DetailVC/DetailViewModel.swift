//
//  DetailViewModel.swift
//  BaiTapMVVM
//
//  Created by Sếp Quân on 4/10/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import Foundation

final class DetailViewModel {
    // MARK: - Properties
    var dataDetail: [DataDetail] = []
    let images = ["image1", "image2", "image3", "image4", "image5"]
    var titleDetail = ""
    var favorite = false
    
    // MARK: - Function
    func numberOfSections() -> Int {
        return 2
    }
    
    func numberOfRowInSection() -> Int {
        return dataDetail.count
    }
    
    func viewModelForCell(at indexPath: IndexPath) -> DetailCellModel {
        let item = dataDetail[indexPath.row]
        let viewModel = DetailCellModel(dataDetail: item)
        return viewModel
    }
    
    func getDataDetail() {
        let data1 = DataDetail(name: "Bùi Thiện Quân", image: "avatarDetail", comment: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ", time: "5 days ago")
        let data2 = DataDetail(name: "Phạm Đức Anh", image: "avatarDetail", comment: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", time: "6 days ago")
        dataDetail.append(contentsOf: [data1, data2])
    }
}
