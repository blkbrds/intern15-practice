//
//  App.swift
//  FinalProject
//
//  Created by Bien Le Q. on 8/26/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import Alamofire
import ObjectMapper
import SwiftUtils

extension Request {
    static func responseJSONSerializer(log: Bool = true,
                                       response: HTTPURLResponse?,
                                       data: Data?,
                                       error: Error?) -> Result<Any> {

        guard Network.shared.isReachable else {
            return .failure(Api.Error.network)
        }

        guard let response = response else {
            if let error = error {
                let errorCode = error.code
                if abs(errorCode) == Api.Error.cancelRequest.code { // code is 999 or -999
                    return .failure(Api.Error.cancelRequest)
                }
                return .failure(error)
            }
            return .failure(Api.Error.noResponse)
        }

        let statusCode = response.statusCode

        if let error = error {
            return .failure(error)
        }

        if 204...205 ~= statusCode { // empty data status code
            return .success([:])
        }

        guard 200...299 ~= statusCode else {
            // Cancel request
            if statusCode == Api.Error.cancelRequest.code {
                return .failure(Api.Error.cancelRequest)
            }

            var err: NSError!

            if statusCode == Api.Error.upgradeRequired.code, let message = data?.toString() {
                err = NSError(code: statusCode, message: message)
            } else if let json = data?.toJSON() as? JSObject,
                let message = json["message"] as? String,
                message.isNotEmpty, let errors = json["errors"] as? [String] {
                err = NSError(code: statusCode, message: message)
                err.errorsString = errors
            } else if let status = HTTPStatus(code: statusCode) {
                err = NSError(domain: Api.Path.baseURL.host, status: status)
            } else {
                err = NSError(domain: Api.Path.baseURL.host,
                              code: statusCode,
                              message: "Unknown HTTP status code received (\(statusCode)).")
            }

            #if DEBUG
                print("Error: \(err.code) - \(err.localizedDescription)")
            #endif
            return .failure(err)
        }

        if let data = data, let json = data.toJSON() {
            // Success
            return .success(json)
        } else if let data = data, let string = data.toString(), string.isEmpty {
            // Success but no response
            return .success([:])
        }
        // Failure
        return .failure(Api.Error.json)
    }
}

extension DataRequest {
    static func responseSerializer() -> DataResponseSerializer<Any> {
        return DataResponseSerializer { _, response, data, error in
            return Request.responseJSONSerializer(log: true,
                                                  response: response,
                                                  data: data,
                                                  error: error)
        }
    }

    @discardableResult
    func responseJSON(queue: DispatchQueue = .global(qos: .background),
                      completion: @escaping (DataResponse<Any>) -> Void) -> Self {
        return response(queue: queue,
                        responseSerializer: DataRequest.responseSerializer(),
                        completionHandler: completion)
    }
}
