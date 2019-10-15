//
//  Enum.swift
//  MVC
//
//  Created by PhuocNguyen on 10/14/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import Foundation

//enum Result {
//    case error(Bool)
//    case result(Float)
//    case overSize(String)
//}

enum Error: String {
    case overSize = "Over caculate"
    case error = "Not a number"
}
enum Operators: String {
    case plus = "+"
    case mutiplied = "X"
    case divide = "/"
    case subtract = "-"
    case none
}


