//
//  tinhToan.swift
//  baiTapMVC
//
//  Created by ADMIN on 4/17/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import Foundation

final class TinhToan {
    static var share = TinhToan()
    var nhanPhepTinh = ""
    var cacPhepTinh: [String] = []
    var ketQua: Int = 0
    func phepTinh(giaTriNhapVao: Int) -> Int {
        switch nhanPhepTinh  {
        case "+" :
            return ketQua + giaTriNhapVao
        case "-" :
            return ketQua - giaTriNhapVao
        case "x" :
            return ketQua * giaTriNhapVao
        case "/" :
            if giaTriNhapVao == 0 {
                return 0
            } else {
                return ketQua / giaTriNhapVao
            }
        default:
            return 0
        }
    }
}

