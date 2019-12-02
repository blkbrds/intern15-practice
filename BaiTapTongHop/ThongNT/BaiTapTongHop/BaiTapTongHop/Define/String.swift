//
//  App.swift
//  FinalProject
//
//  Created by Bien Le Q. on 8/26/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//
import Foundation

extension App {

    /**
     This file defines all localizable strings which are used in this application.
     Please localize defined strings in `Resources/Localizable.strings`.
     */

    struct String {}
    struct Home {}
}

extension App.Home {
    static var alertMessage: String { return "Bạn có muốn xoá không?".localized() }
}
