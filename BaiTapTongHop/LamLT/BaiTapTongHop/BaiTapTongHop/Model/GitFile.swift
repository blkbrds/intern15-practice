//
//  GitFile.swift
//  BaiTapTongHop
//
//  Created by PCI0002 on 6/11/20.
//  Copyright © 2020 LeThanhLam. All rights reserved.
//

import Foundation

class GitFile {
    var fileName: String
    var type: String
    var language: String
    var rawUrl: String
    var size: Int

    init(fileName: String, type: String, language: String, rawUrl: String, size: Int) {
        self.fileName = fileName
        self.type = type
        self.language = language
        self.rawUrl = rawUrl
        self.size = size
    }
}
