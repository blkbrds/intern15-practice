//
//  ketQua.swift
//  baiTapMVC
//
//  Created by ADMIN on 4/22/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import Foundation

final class ToanHang {
    var soBanDau: Int = 0
    var cacSoTrongMang: [Int] = []
    func themSo(soDuocThem: Int) -> Int {
        if self.soBanDau * 10 + soDuocThem <= 999999 {
           self.soBanDau = self.soBanDau * 10 + soDuocThem
        }
        return self.soBanDau
    }
}
