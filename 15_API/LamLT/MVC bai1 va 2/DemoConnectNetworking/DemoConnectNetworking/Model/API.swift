//
//  API.swift
//  DemoConnectNetworking
//
//  Created by PCI0002 on 4/20/20.
//  Copyright © 2020 LeThanhLam. All rights reserved.
//

import Foundation

//MARK: - Defines
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
