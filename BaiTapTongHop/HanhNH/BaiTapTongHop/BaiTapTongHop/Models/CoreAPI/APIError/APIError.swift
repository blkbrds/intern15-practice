//
//  APIError.swift
//  BaiTapTongHop
//
//  Created by ANH NGUYỄN on 1/6/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation

typealias APICompletion<T> = (Result<T, Error>) -> Void
typealias Completion = (APIResult) -> Void

enum APIResult {
    case success(Data?)
    case failure(Error)
}

struct API {
    //singleton
    private static var shareAPI: API = {
        let shareAPI = API()
        return shareAPI
    }()

    static func shared() -> API {
        return shareAPI
    }

    //init
    private init() { }
}
