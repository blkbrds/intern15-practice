//
//  App.swift
//  FinalProject
//
//  Created by Bien Le Q. on 8/26/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import Foundation
import Alamofire
import SwiftUtils

typealias Network = NetworkReachabilityManager

// MARK: - Network
extension Network {

    static let shared: Network = {
        guard let manager = Network() else {
            fatalError("Cannot alloc network reachability manager!")
        }
        return manager
    }()
}

extension Api {

    struct Error {
        static let network = NSError(domain: NSCocoaErrorDomain, message: "Occurred network connection error. Please check your network connection and try again.")
        static let notFound = NSError(domain: NSCocoaErrorDomain, code: 404, message: "The requested page could not be found but may be available again in the future.")
        static let authen = NSError(domain: Api.Path.baseURL, status: HTTPStatus.unauthorized)
        static let apiKey = NSError(domain: Api.Path.baseURL, status: HTTPStatus.badRequest)
        static let json = NSError(domain: NSCocoaErrorDomain, code: 3_840, message: "The operation couldn’t be completed.")
        static let cancelRequest = NSError(domain: Api.Path.baseURL, code: 999, message: "Server returns no information and closes the connection.")
        static let emptyData = NSError(domain: Api.Path.baseURL, code: 997, message: "Server returns no data")
        static let noResponse = NSError(status: .noResponse)
        static let invalidURL = NSError(domain: Api.Path.baseURL, code: 998, message: "Cannot detect URL")
        static let emailCannotUsed = NSError(domain: Api.Path.baseURL, code: 996, message: "This email cannot be used at the moment!")
        static let usernameExistence = NSError(domain: Api.Path.baseURL, code: 995, message: "")
        static let upgradeRequired = NSError(domain: Api.Path.baseURL.host, code: 426, message: "ForceUpdate")
        static let invalid = NSError(domain: Api.Path.baseURL.host, code: 9_999, message: "Parameter has no value")
        static let timeout = NSError(domain: Api.Path.baseURL.host, code: -1_001, message: "The request timeout")
        static let forbidden = NSError(domain: Api.Path.baseURL.host, code: 403, message: "The request was a legal request, but the server is refusing to respond to it.")
        static let badRequest: NSError = NSError(domain: Api.Path.baseURL.host, code: 400, message: "The request cannot be fulfilled due to bad syntax.")
        static let connectionAbort: NSError = NSError(domain: NSPOSIXErrorDomain, code: 53, message: "Software caused connection abort.")
        static let connectionWasLost: NSError = NSError(domain: NSURLErrorDomain, code: -1_005, message: "The network connection was lost.")

        // Error for accountPF
        static let notEnoughData = NSError(domain: NSCocoaErrorDomain, code: 898, message: "Could not get the necessary data to open the App. Please try again.")
        static let unexpectIssued = NSError(domain: NSCocoaErrorDomain, code: 899, message: "Our service has occurred unexpect issued. Please try again later!")
        static let deleteAccountPF = NSError(domain: NSCocoaErrorDomain, code: 900, message: "Unable to authenticate your account. Please try again.")
        static let wrongState = NSError(domain: NSCocoaErrorDomain, code: 991, message: "An error occurred. Please start from the beginning.")
        static let emptyCode = NSError(domain: NSCocoaErrorDomain, code: 992, message: "Your session has expired. Please log in and try again.")
        static let loginAccountPF = NSError(domain: NSCocoaErrorDomain, code: 993, message: "ログインに失敗しました。")
        static let downloadAsset = NSError(domain: NSCocoaErrorDomain, code: 994, message: "")
    }
}

extension Error {

    func show() {
        let `self` = self as NSError
        self.show()
    }

    public var code: Int {
        let `self` = self as NSError
        return self.code
    }

    public var errorsString: [String] {
        let `self` = self as NSError
        return self.errorsString
    }
}

extension NSError {
    func show() { }
}
