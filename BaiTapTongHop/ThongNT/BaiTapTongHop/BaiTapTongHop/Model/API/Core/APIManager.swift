//
//  App.swift
//  FinalProject
//
//  Created by Bien Le Q. on 8/26/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import Foundation
import Alamofire

typealias JSObject = [String: Any]
typealias JSArray = [JSObject]

typealias Completion<Value> = (Result<Value>) -> Void
typealias APICompletion = (APIResult) -> Void

enum APIResult {
    case success(Data?)
    case failure(Error)
}

// MARK: - Get error for api result
extension APIResult {

    var error: Error? {
        switch self {
        case .success:
            return nil
        case .failure(let error):
            return error
        }
    }
}

struct ApiManager {

    struct Path {
        static let baseURL = "https://api.foursquare.com/v2/"
        static let getImageURL = "https://irs0.4sqi.net/img/general/500x300/1242105_kaulHppyI2YfjLjFCr0OEUMRlat3hlaUxmHO3ENmXxo.jpg"
        static let baseURLDirection = "https://maps.googleapis.com/maps/api/directions/json?"
    }
    
    struct Key {
        static let GoogleAPI = "AIzaSyAZGlweYtcWgzVKTUt5nz961P0ipsCtO3c"
    }
    
    struct Places {}

    struct Downloader {}
    
    struct Direction {}
}
