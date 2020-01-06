//
//  DateFormat.swift
//  abc
//
//  Created by PhuocNguyen on 11/13/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import Foundation

extension Date {
    func convertToString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let dateString = dateFormatter.string(from: self)
        return dateString
    }
}

extension String {
    func convertToDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = dateFormatter.date(from: self)
        return date
    }
}
