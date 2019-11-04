//
//  API+Data.swift
//  BaiTap2
//
//  Created by Nguyen Duong on 8/26/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import Foundation
import UIKit

extension Data {
    func convertToJSON() -> [String: Any] {
        var json: [String: Any] = [:]
        do {
            if let jsonObj = try JSONSerialization.jsonObject(with: self, options: .mutableContainers) as? [String: Any] {
                json = jsonObj
            }
        } catch {
            print("JSON casting error")
        }
        return json
    }
    
   
}
