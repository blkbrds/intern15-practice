//
//  API.swift
//  BaiTap2
//
//  Created by Nguyen Duong on 8/26/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import Foundation

// Defines
enum APIError: Error {
    case error(String)
    case errorURL
    
    var localizedDescription: String {
        switch self {
        case .error(let string):
            return string
        case .errorURL:
            return "URL String is error."
        }
    }
}
    
typealias APICompletion<T> = (Result<T, APIError>) -> Void
    
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
    
    struct Path {
        static let baseURL = ""
        static let playVideo = "https://www.youtube.com/embed/"
    }
    
//    weak var delegate: APIDelegate?
    
    //init
    private init() {}
}
