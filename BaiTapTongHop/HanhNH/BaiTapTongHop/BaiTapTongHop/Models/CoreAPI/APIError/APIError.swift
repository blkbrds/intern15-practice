//
//  APIError.swift
//  BaiTapTongHop
//
//  Created by ANH NGUYỄN on 1/6/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation

typealias APICompletion<T> = (Result<T, APIError>) -> Void
typealias Completion = (APIResult) -> Void

enum APIError: Error {
    case error(String)
    case errorURL
    case errorRealm

    var localizedDescription: String {
        switch self {
        case .error(let string):
            return string
        case .errorURL:
            return "URL String is error."
        case .errorRealm:
            return "Not Realm"
        }
    }
}

enum APIResult {
    case success(Data?)
    case failure(APIError)
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
