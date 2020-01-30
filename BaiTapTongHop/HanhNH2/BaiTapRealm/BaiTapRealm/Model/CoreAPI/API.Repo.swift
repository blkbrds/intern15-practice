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
    var totalCount: Int
}

extension APIManager.Repository {

    func search(completion: @escaping APICompletion<RepoResults?>) {
        let url = Router.Repository.path
        API.shared().request(urlString: url) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    completion(.failure(error))
                case .success(let data):
                    if let data = data {
                        let json = data.toJSON()
                        var result = RepoResults(repos: [], totalCount: 0)
                        if let totalCount = json["total_count"] as? Int {
                            result.totalCount = totalCount
                        }
                        if let items = json["items"] as? [JSON] {
                            var repos: [Repository] = []
                            for item in items {
                                let repo = Repository(json: item)
                                repos.append(repo)
                            }
                            let repoResults = RepoResults(repos: repos, totalCount: result.totalCount)
                            completion(.success(repoResults))
                        }
                    } else {
                        completion(.failure(Errors.noDataError))
                    }
                }
            }
        }
    }
}
