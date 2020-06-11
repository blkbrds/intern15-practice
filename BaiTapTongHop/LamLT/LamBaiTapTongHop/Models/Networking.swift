//
//  Networking.swift
//  API_MVVM_2
//
//  Created by PCI0002 on 5/28/20.
//  Copyright © 2020 LeThanhLam. All rights reserved.
//

import Foundation

//MARK: Structs
struct RepositoriesResult {
    var repos: [Repositories]
    var totalCount: Int
}

struct GitResult {
    var gits: [Git]
}

//MARK: Enum
enum APIResult<T> {
    case failure(String)
    case success(T)
}

//MARK: Typealias
typealias APICompletion<T> = (APIResult<T>) -> Void

final class Networking {
    
    //MARK: Properties
    let urlString = "https://api.github.com/search/repositories?q=Swift&sort=stars&order=desc&per_page=30"

    let urlString2 = "https://api.github.com/gists/public?per_page=10"

    let urlString3 = "https://api.github.com/users"
    
    private static var sharedNetworking: Networking = {
        let networking = Networking()
        return networking
    }()

    class func shared() -> Networking {
        return sharedNetworking
    }

    //MARK: Public Function
    func getRepo(page: Int, apiCompletion: @escaping APICompletion<RepositoriesResult>) {
        guard let url = URL(string: urlString + "&page=\(page)") else {
            apiCompletion(.failure("Failed"))
            return
        }
        let config = URLSessionConfiguration.ephemeral
        config.waitsForConnectivity = true

        let session = URLSession(configuration: config)
        let task = session.dataTask(with: url) { (data, respone, error) in
            DispatchQueue.main.async {
                if let _ = error {
                    apiCompletion(.failure("Can't Connect"))
                } else {
                    if let data = data {
                        let json = data.toJSON()
                        let totalCount = json["total_count"] as! Int
                        let items = json["items"] as! [JSON]
                        var repositories = [Repositories]()
                        for item in items {
                            let repo = Repositories(json: item)
                            repositories.append(repo)
                        }
                        let result = RepositoriesResult(repos: repositories, totalCount: totalCount)
                        apiCompletion(.success(result))
                    } else {
                        apiCompletion(.failure("Connect Failed"))
                    }
                }
            }
        }
        task.resume()
    }

    func getReposByUsers(login: String, apiCompletion: @escaping APICompletion<RepositoriesResult>) {
        guard let url = URL(string: urlString3 + "/\(login)/repos") else {
            apiCompletion(.failure("Failed URL"))
            return
        }
        let config = URLSessionConfiguration.ephemeral
        config.waitsForConnectivity = true

        let session = URLSession(configuration: config)
        let task = session.dataTask(with: url) { (data, reposone, error) in
            DispatchQueue.main.async {
                if let _ = error {
                    apiCompletion(.failure("Can't Connect API"))
                } else {
                    if let data = data {
                        let json = data.toArrayJSON()
                        var repositories = [Repositories]()
                        for item in json {
                            let repo = Repositories(json: item)
                            repositories.append(repo)
                        }
                        let repoResult = RepositoriesResult(repos: repositories, totalCount: 0)
                        apiCompletion(.success(repoResult))
                    } else {
                        apiCompletion(.failure("Failed Data"))
                    }
                }
            }
        }
        task.resume()
    }

    func getGits(apiGitCompletion: @escaping APICompletion<GitResult>) {
        guard let url = URL(string: urlString2) else {
            apiGitCompletion(.failure("Load Failed"))
            return
        }
        let config = URLSessionConfiguration.ephemeral
        config.waitsForConnectivity = true

        let session = URLSession(configuration: config)
        let task = session.dataTask(with: url) { (data, respone, error) in
            DispatchQueue.main.async {
                if let _ = error {
                    apiGitCompletion(.failure("Can't Connect API GIT"))
                } else {
                    if let data = data {
                        let json = data.toArrayJSON()
                        var gits = [Git]()
                        for item in json {
                            let git = Git(json: item)
                            gits.append(git)
                        }
                        let gitsResult = GitResult(gits: gits)
                        apiGitCompletion(.success(gitsResult))
                    }
                }
            }
        }
        task.resume()
    }
}
