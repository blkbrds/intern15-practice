//
//  API.Logo.swift
//  BaiTapTongHop
//
//  Created by ANH NGUYỄN on 12/31/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import Foundation
extension APIManager.Repo {
    struct QureryString {
        func hotRepo(page: Int) -> String {
            return APIManager.Path.firstDommin
                + APIManager.Path.basePath
                + APIManager.Path.path
                + "page=\(page)"
                + APIManager.Path.hotPath
        }
    }
    struct RepoResults {
        var repos: [Repo]
        var total_count: Int
    }
    static func getRepo(page: Int = 1, completion: @escaping APICompletion<RepoResults>) {

        let urlString = QureryString().hotRepo(page: page)
        print(urlString)
        API.shared().request(urlString: urlString) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    completion(.failure(error))
                case .success(let data):
                    if let data = data {
                        let json = data.toJSON()
                        guard let total_count = json["total_count"] as? Int else {
                            return
                        }
                        guard let items = json["items"] as? [JSON] else {
                            return
                        }
                        var repos: [Repo] = []
                        for item in items {
                            let repo = Repo(json: item)
                            repos.append(repo)
                        }
                        let repoResults = RepoResults(repos: repos, total_count: total_count)

                        completion(.success(repoResults))
                    } else {
                        completion(.failure(.error("Not Data................")))
                    }
                }
            }
        }
    }
}
