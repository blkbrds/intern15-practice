//
//  DataManagement.swift
//  baitap04+07+08
//
//  Created by user on 12/18/19.
//  Copyright © 2019 VienH. All rights reserved.
//

import Foundation

final class DataManagement {

    // MARK: - Singleton
    private static let sharedDataManagement: DataManagement = {
        let dataManagement = DataManagement()
        return dataManagement
    }()

    class func shared() -> DataManagement {
        return sharedDataManagement
    }

    // MARK: - init
    private init() { }

    // MARK: - Public func
    func getDataFromFile(fileName: String, type: String) -> [String]? {
        guard let array = NSArray(contentsOfFile: getFileDocumentPath(fileName: fileName, type: type)) else { return [] }
        var strings: [String] = []
        for item in array {
            guard let item = item as? String else { break }
            strings.append(item)
        }
        return strings
    }

    // MARK: - Private func
    func getFileDocumentPath(fileName: String, type: String) -> String {
        guard let path = Bundle.main.path(forResource: fileName, ofType: type) else { return "" }
        return path
    }
}

