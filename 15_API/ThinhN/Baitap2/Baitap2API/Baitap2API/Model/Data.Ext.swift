//
//  Data.Ext.swift
//  Baitap2API
//
//  Created by ADMIN on 7/29/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import Foundation
import UIKit

typealias JSON = [String: Any]

extension Data {
    func toJSON() -> JSON {
        var json: [String: Any] = [:]
        do {
            if let jsonObj = try JSONSerialization.jsonObject(with: self, options: .mutableContainers) as? JSON {
                json = jsonObj
            }
        } catch {
            print("JSON catching error")
        }
        return json
    }
}