//
//  ChooseRegion.swift
//  BaiTap03
//
//  Created by PCI0002 on 12/2/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import Foundation

final class ChooseLocation {
    var region: String
    var province: String
    var district: String
    
    init(chooseRegion region: String, chooseProvince province: String, chooseDistrict district: String) {
        self.region = region
        self.province = province
        self.district = district
    }
    
    func toString() {
        print(region, province, district)
    }
}
