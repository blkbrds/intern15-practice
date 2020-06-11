//
//  HomeViewModel.swift
//  API_MVVM_2
//
//  Created by PCI0002 on 5/28/20.
//  Copyright © 2020 LeThanhLam. All rights reserved.
//

import Foundation
import UIKit

class HomeModel {

    //MARK: Properties
    var page: Int = 1
    var totalCount = 0
    var repos: [Repositories] = []
    var isLoading: Bool = false

    var gits: [Git] = []

    var filesGit: [GitFile] = []
    
    var repo: [RepoRealm] = []

    //MARK: Load API
    func loadAPi(apiCompletion: @escaping (Bool, String) -> Void) {
        if isLoading {
            return
        }
        isLoading = true

        Networking.shared().getRepo(page: self.page) { (repoResult) in
            self.isLoading = false
            switch repoResult {
            case .failure(let error):
                apiCompletion(false, error)
            case .success(let repositoriesResult):

                self.totalCount = repositoriesResult.totalCount
                self.repos.removeAll()
                self.page = 1

                for item in repositoriesResult.repos {
                    self.repos.append(item)
                }

                apiCompletion(true, "Connect API Success")
            }
        }
    }

    func loadMoreAPI(apiCompletion: @escaping (Bool, String) -> Void) {
        if self.repos.count < totalCount {
            if isLoading {
                return
            }
            isLoading = true
            self.page += 1

            Networking.shared().getRepo(page: self.page) { (repoResult) in
                self.isLoading = false
                switch repoResult {
                case .failure(let error):
                    apiCompletion(false, error)
                case .success(let repositoriesResult):

                    for item in repositoriesResult.repos {
                        self.repos.append(item)
                    }

                    apiCompletion(true, "Connect API Success")
                }
            }
        } else {
            apiCompletion(false, "Can't Load More Items")
        }
    }

    func loadGitAPI(apiGitCompletion: @escaping (Bool, String) -> Void) {
        Networking.shared().getGits { (gitResult) in
            switch gitResult {
            case .failure(let error):
                apiGitCompletion(false, error)
            case .success(let gitsResult):
                for item in gitsResult.gits {
                    self.gits.append(item)
                }
            }
        }
    }

    //MARK: - TableView Data
    func numberOfSections() -> Int {
        return 2
    }

    func numberOfRowsInSection(section: Int) -> Int {
        if section == 0 {
            return gits.count
        } else if section == 1 {
            return repos.count
        }
        return 0
    }

    func heightForRowAt(indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 55
        } else if indexPath.section == 1 {
            return 120
        }
        return 0
    }

    func homeModelForCell(at indexPath: IndexPath) -> HomeCellModel {
        let item = repos[indexPath.row]
        let viewmodel = HomeCellModel(repo: item)
        return viewmodel
    }


    func gitViewModel(at indexPath: IndexPath) -> GitModel {
        let item = gits[indexPath.row]
        let viewmodel = GitModel(git: item)
        return viewmodel
    }


    func detailViewModelForCell(at indexPath: IndexPath) -> DetailViewModel {
        let item = repos[indexPath.row]
        let viewmodel = DetailViewModel(repo: item)
        return viewmodel
    }

    func detailGitViewModelForCell(at indexPath: IndexPath) -> GitDetailViewModel {
        let item = gits[indexPath.row]
        let viewmodel = GitDetailViewModel(git: item)
        return viewmodel
    }

    //MARK: Download Image
    func downloadImageCell(at indexPath: IndexPath, completion: @escaping (IndexPath, UIImage?) -> Void) {
        let item = repos[indexPath.row]
        if item.thumbnailImage == nil {
            Downloader.shared().downloadImage(urlString: item.owner.avatarUrl) { (image) in
                if let image = image {
                    item.thumbnailImage = image
                    completion(indexPath, image)
                } else {
                    completion(indexPath, nil)
                }
            }
        }
    }

    func downloadGitImageCell(at indexPath: IndexPath, completion: @escaping (IndexPath, UIImage?) -> Void) {
        let item = gits[indexPath.row]
        if item.thumbnailImage == nil {
            Downloader.shared().downloadImage(urlString: item.owner.avatarUrl) { (image) in
                if let image = image {
                    item.thumbnailImage = image
                    completion(indexPath, image)
                } else {
                    completion(indexPath, nil)
                }
            }
        }
    }

//    func getRepoRealm(at indexPath: IndexPath) -> RepoRealm {
//        return repo[indexPath.row]
//    }
}
