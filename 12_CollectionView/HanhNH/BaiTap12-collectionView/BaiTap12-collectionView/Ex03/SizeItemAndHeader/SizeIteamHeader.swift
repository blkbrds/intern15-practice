//
//  SizeIteamHeader.swift
//  BaiTap12-collectionView
//
//  Created by ANH NGUYỄN on 12/3/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import UIKit
//standard: tieu chuan và small: nho be
enum Status {
    case standard
    case small

    var itemSize: CGSize {
        switch self {
        case .standard:
            return CGSize(width: 150, height: 180)
        case .small:
            return CGSize(width: 100, height: 100)
        }
    }

    var sectionInset: UIEdgeInsets {
        switch self {
        case .standard: return UIEdgeInsets(top: 20, left: 40, bottom: 20, right: 40)
        case .small: return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        }
    }

    var headerReferenceSize: CGSize {
        switch self {
        case .standard:
            return CGSize(width: 400, height: 50)
        case .small:
            return CGSize(width: 400, height: 50)
        }
    }
}
