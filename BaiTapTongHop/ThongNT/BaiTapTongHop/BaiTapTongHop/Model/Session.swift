//
//  App.swift
//  FinalProject
//
//  Created by Bien Le Q. on 8/26/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import Foundation

final class Session {

    static let shared = Session()

    private init() {}
}

// MARK: - Protocol
protocol SessionProtocol: class {
}
