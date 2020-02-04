//
//  Errors.swift
//  BaiTapRealm
//
//  Created by ANH NGUYỄN on 1/22/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation

struct Errors {
    static let realmError = NSError(domain: "",
                                   code: 1000,
                                   userInfo: [NSLocalizedDescriptionKey: "Realm error"])
    static let noDataError = NSError(domain: "",
                                code: 404,
                                userInfo: [NSLocalizedDescriptionKey: "No Data Error"])
    
    static let cannotDeleteError = NSError(domain: "",
                                           code: 404,
                                           userInfo: [NSLocalizedDescriptionKey: "Can not complete this deletion."])
}
