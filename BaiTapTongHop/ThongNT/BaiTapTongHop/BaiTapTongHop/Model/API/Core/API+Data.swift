//
//  API+Data.swift
//  BaiTapTongHop
//
//  Created by PCI0018 on 12/16/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import Foundation

extension Data {

    func convertToJSON(from data: Data) -> [String: Any] {
        var json: [String: Any] = [:]
        do {
            if let jsonObj = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                json = jsonObj
            }
        } catch {
            print("Casting Error")
        }
        return json
    }
}

extension Dictionary {
    func convertToData() -> Data {
        do {
            let data = try JSONSerialization.data(withJSONObject: self, options: [])
            return data
        } catch {
            fatalError("JSON casting error")
        }
    }
}
