//
//  API+Data.swift
//  ExampleGoogleMaps
//
//  Created by PCI0002 on 12/26/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
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
