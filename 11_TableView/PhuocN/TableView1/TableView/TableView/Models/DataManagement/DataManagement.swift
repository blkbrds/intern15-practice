//
//  DataManagement.swift
//  TableView
//
//  Created by PhuocNguyen on 10/18/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import Foundation

class DataManagement {
    public static let share: DataManagement = DataManagement()
    
    private init() {}
    
    func getUser(fileName: String, type: String) -> [String] {
        guard let array = NSArray(contentsOfFile: getFileDocumentPath(fileName: fileName, type: type)) else { return [] }
        var result: [String] = []
        for item in array {
            guard let str =  item as? String else { return [] }
            result.append(str)
        }
        return result
    }
    
    func getFileDocumentPath(fileName: String, type: String) -> String {
        return (Bundle.main.path(forResource: fileName, ofType: type)) ?? ""
    }
}
