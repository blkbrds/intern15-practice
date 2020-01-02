//
//  App.swift
//  FinalProject
//
//  Created by Bien Le Q. on 8/26/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//
import Foundation

extension App {

    struct String {}
    struct Home {}
}

extension App.Home {
    static var alertMessage: String { return "Do you want to delete?".localized()}
    static var alertTitle: String { return "".localized()}
}
