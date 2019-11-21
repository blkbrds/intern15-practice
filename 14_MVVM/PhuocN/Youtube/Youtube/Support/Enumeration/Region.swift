//
//  Region.swift
//  abc
//
//  Created by PhuocNguyen on 11/6/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import Foundation

enum Region {
    case VietNam
    case USA
    case Korean
    case Japan
    case Britain
    
    static var regions: [Region] {
        return [.VietNam, .USA, .Korean, .Britain, .Japan]
    }
    
    var code: String {
        switch self {
        case .VietNam:
            return "VN"
        case .USA:
            return "US"
        case .Korean:
            return "KR"
        case .Japan:
            return "JP"
        case .Britain:
            return "GB"
        }
    }
    
    var title: String {
        switch self {
        case .VietNam:
            return "Viet Nam"
        case .USA:
            return "America"
        case .Korean:
            return "Korean"
        case .Japan:
            return "Japan"
        case .Britain:
            return "United Kingdom"
        }
    }
}
