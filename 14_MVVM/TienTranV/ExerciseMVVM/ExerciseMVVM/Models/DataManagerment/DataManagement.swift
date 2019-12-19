//
//  DataManagement.swift
//  BaiTap02
//
//  Created by PCI0002 on 11/27/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import Foundation

final class DataManagement {
    
    // MARK: - Singleton
    private static var sharedDataManagement: DataManagement = {
        let dataManagement = DataManagement()
        return dataManagement
    }()

    static func shared() -> DataManagement {
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
        return (Bundle.main.path(forResource: fileName, ofType: type)) ?? ""
    }
}
