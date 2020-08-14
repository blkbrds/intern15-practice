//
//  MoveDetail.swift
//  API_Bo_sung
//
//  Created by ADMIN on 8/14/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import Foundation

class MoveDetail {
    var url: String
    var learnLevelName: Int
    var learnMethodName: String
    var versionGroupName: String
    init(url: String, learnLevelName: Int,learnMethodName: String, versionGroupName: String ) {
        self.url = url
        self.learnLevelName = learnLevelName
        self.learnMethodName = learnMethodName
        self.versionGroupName = versionGroupName
    }
}
