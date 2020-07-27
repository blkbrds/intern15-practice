//
//  API.swift
//  API
//
//  Created by ADMIN on 7/26/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import Foundation

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
