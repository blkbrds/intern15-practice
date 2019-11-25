//
//  App.swift
//  FinalProject
//
//  Created by Bien Le Q. on 8/26/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import Foundation

typealias Errors = App.Errors

extension App {

    enum Errors: Error {

        case indexOutOfBound
        case initFailure
    }
}
extension App.Errors: CustomStringConvertible {

     var description: String {
        switch self {
        case .indexOutOfBound: return "Index is out of bound"
        case .initFailure: return "Init failure"
        }
    }
}
