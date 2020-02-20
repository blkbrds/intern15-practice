//
//  Data.Ext.swift
//  BaitapHandleYoutubeAPI
//
//  Created by PCI0008 on 2/12/20.
//  Copyright © 2020 PCI0008. All rights reserved.
//

import Foundation

typealias JSONObject = [String: Any]
typealias JSONArray = [JSONObject]

extension Data {
    func toJSON() -> JSONObject {
        var json: [String: Any] = [:]
        do {
            if let jsonObj = try JSONSerialization.jsonObject(with: self, options: .mutableContainers) as? JSONObject {
                json = jsonObj
            }
        } catch {
            print("JSON casting error")
        }
        return json
    }
}
