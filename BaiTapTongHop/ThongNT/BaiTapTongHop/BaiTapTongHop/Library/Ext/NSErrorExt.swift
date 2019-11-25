//
//  App.swift
//  FinalProject
//
//  Created by Bien Le Q. on 8/26/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import Foundation

private struct ErrorFieldKey {
    static var errors = "Errors"
}

extension NSError {

    var errorsString: [String] {
        set {
            objc_setAssociatedObject(self, &ErrorFieldKey.errors, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
        get {
            guard let errors = objc_getAssociatedObject(self, &ErrorFieldKey.errors) as? [String] else { return [] }
            return errors
        }
    }
}
