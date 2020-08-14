//
//  MoveDetailViewModel.swift
//  API_Bo_sung
//
//  Created by ADMIN on 8/14/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import Foundation
import UIKit

enum ListInformation {
    case learnLevelName
    case learnMethodName
    case versionGroupName
}

class MoveDetailViewModel {

    var url: String
    var learnLevelName: [Int] = []
    var learnMethodName: [String] = []
    var versionGroupName: [String] = []
    var listInformation: [ListInformation] = [.learnLevelName, .learnMethodName, .versionGroupName]

    init(url: String) {
        self.url = url
    }
    func loadAPI(completion: @escaping Completion) {
        let urlString = url
        let url1 = URL(string: urlString)
        var request = URLRequest(url: url1!)
        request.httpMethod = "GET"

        let config = URLSessionConfiguration.ephemeral
        config.waitsForConnectivity = true

        let session = URLSession(configuration: config)
        let task = session.dataTask(with: request) {(data, response, error ) in DispatchQueue.main.async {
            if let error = error {
                completion(false, error.localizedDescription)
            } else {
                if let data = data {
                    let json = data.toJSON()
                    guard let moves = json["moves"] as? [JSON] else { return }
                    for item in moves {
                        guard let version_group_details = item["version_group_details"] as? [JSON] else { return }
                        for item in version_group_details {
                            guard let level_learned_at = item["level_learned_at"] as? Int, let move_learn_method = item["move_learn_method"] as? JSON, let name = move_learn_method["name"] as? String, let version_group = item["version_group"] as? JSON, let name1 = version_group["name"] as? String else { return }
                            self.learnLevelName.append(level_learned_at)
                            self.learnMethodName.append(name)
                            self.versionGroupName.append(name1)
                        }
                    }
                    completion(true, "")
                } else {
                    completion(false, "Data ...")
                }
            }
            }
        }
        task.resume()
    }

}
