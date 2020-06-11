//
//  Data.swift
//  BaiTapTongHop
//
//  Created by PCI0002 on 6/11/20.
//  Copyright © 2020 LeThanhLam. All rights reserved.
//

import Foundation

typealias JSON = [String: Any]

extension Data {
    func toJSON() -> JSON {
        var json: [String: Any] = [:]
        do {
            if let jsonObj = try JSONSerialization.jsonObject(with: self, options: .mutableContainers) as? JSON {
                json = jsonObj
            }
        } catch {
            print("Data Can't Format")
        }
        return json
    }

    func toArrayJSON() -> [JSON] {
        var json: [[String: Any]] = []
        do {
            if let jsonObj = try JSONSerialization.jsonObject(with: self, options: .mutableContainers) as? [JSON] {
                json = jsonObj
            }
        } catch {
            print("Data Can't Format")
        }
        return json
    }
}
