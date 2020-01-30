//
//  API.Repo.swift
//  BaiTapRealm
//
//  Created by ANH NGUYỄN on 1/22/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation
struct RepoResults {
    var repos: [Repository]
    var total_count: Int
}

extension APIManager.Repository {

    func search(completion: @escaping APICompletion<RepoResults>) {
        let url = Router.Repository.path
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
                        var repos: [Repository] = []
                        for item in items {
                            let repo = Repository(json: item)
                            repos.append(repo)
                        }
                        let repoResults = RepoResults(repos: repos, total_count: total_count)

                        completion(.success(repoResults))
                    } else {
                        completion(.failure(Errors.noDataError))
                    }
                }
            }
        }
    }
}
