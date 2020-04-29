//
//  Api.swift
//  BaiTapTongHop
//
//  Created by user on 4/28/20.
//  Copyright © 2020 VienH. All rights reserved.
//

import Foundation
import Alamofire

final class Api {

    struct Path {
        static let baseURL = "https://api.foursquare.com/v2/venues"
    }

    struct Home { }

    struct Search { }

    struct Map { }

    struct Photo { }
}

extension Api.Path {
    struct Home {
        static var path: String {
            return baseURL / "search"
        }

        static var basePath: String = ""
        static var homePath: String {
            return baseURL / basePath
        }
    }
    
    struct Photo {
        static var basePath: String = ""
        static var photoPath: String {
            return baseURL / basePath / "photos"
        }
    }

    struct Detail {
        static var basePath: String = ""
        static var path: String {
            return baseURL / basePath
        }
    }

    struct Search {
        static var path: String {
            return baseURL / "search"
        }
    }

    struct Map {
        static var path: String {
            return baseURL / "Search"
        }
    }
}

protocol URLStringConvertible {
    var urlString: String { get }
}

protocol ApiPath: URLStringConvertible {
    static var path: String { get }
}

private func / (lhs: URLStringConvertible, rhs: URLStringConvertible) -> String {
    return lhs.urlString + "/" + rhs.urlString
}

extension String: URLStringConvertible {
    var urlString: String { return self }
}

private func / (left: String, right: Int) -> String {
    return left.appending(path: "\(right)")
}

