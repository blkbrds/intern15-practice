//
//  Data.swift
//  BaiTest
//
//  Created by Sếp Quân on 4/29/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import Foundation

final class DataTest {
    var name: String
    var tieusu: String
    var diachi: String
    var gioitinh: String
    var ngay: String
    var image: String

    init(name:String = "", tieusu: String = "", diachi: String = "", gioitinh: String = "", ngay: String = "", image: String = "") {
        self.name = name
        self.tieusu = tieusu
        self.diachi = diachi
        self.gioitinh = gioitinh
        self.ngay = ngay
        self.image = image
    }
}
