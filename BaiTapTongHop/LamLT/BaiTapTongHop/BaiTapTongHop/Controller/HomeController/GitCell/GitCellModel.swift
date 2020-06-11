//
//  GitCellModel.swift
//  BaiTapTongHop
//
//  Created by PCI0002 on 6/11/20.
//  Copyright © 2020 LeThanhLam. All rights reserved.
//

import Foundation
import UIKit

class GitModel {
    var url: String
    var forksURL: String
    var commitsUrl: String
    var id: String
    var nodeId: String
    var htmlUrl: String
    var publiC: Bool
    var createdAt: String
    var updateAt: String
    var commentsURL: String

    var login: String
    var idOwner: Int
    var typeOwner: String
    var thumbnail: UIImage?

    init(git: Git) {
        self.url = git.url
        self.forksURL = git.forksURL
        self.commitsUrl = git.commitsUrl
        self.id = git.id
        self.nodeId = git.nodeId
        self.htmlUrl = git.htmlUrl
        self.publiC = git.publiC
        self.createdAt = git.createdAt
        self.updateAt = git.updateAt
        self.commentsURL = git.commentsURL

        self.login = git.owner.login
        self.idOwner = git.owner.id
        self.typeOwner = git.owner.type
        self.thumbnail = git.thumbnailImage
    }
}

