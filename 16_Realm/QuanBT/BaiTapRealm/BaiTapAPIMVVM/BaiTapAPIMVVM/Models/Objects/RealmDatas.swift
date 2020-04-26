//
//  RealmDatas.swift
//  BaiTapAPIMVVM
//
//  Created by Sếp Quân on 4/24/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import Foundation
import RealmSwift

final class RealmDatas: Object {
    // MARK: - Properties
    @objc dynamic var idVideo: String = ""
    @objc dynamic var titleVideo: String = ""
    @objc dynamic var channelTitle: String = ""
    @objc dynamic var publishedAt: String = ""
    @objc dynamic var url: String = ""
    @objc dynamic var favorite: Bool = true
}
