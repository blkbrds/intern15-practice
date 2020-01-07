//
//  API.Repo.swift
//  BaiTapTongHop
//
//  Created by ANH NGUYỄN on 1/6/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation

struct RepoResults {
    var repos: [Repo]
    var total_count: Int
}

extension APIManager.Repository {
    
    func search(params: [String: String], completion: @escaping APICompletion<RepoResults>) {
        var url = Router.Repository.path
        let queries = params.map { return $0.key + "=" + $0.value }
        url = url + "?" + queries.joined(separator: "&")
        API.shared().request(urlString: url) { (result) in
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
                        completion(.failure(.error(Strings.notData)))
                    }
                }
            }
        }
    }
}
