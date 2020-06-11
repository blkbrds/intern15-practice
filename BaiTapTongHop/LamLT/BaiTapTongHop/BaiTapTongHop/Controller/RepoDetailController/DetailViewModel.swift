//
//  DetailViewModel.swift
//  BaiTapTongHop
//
//  Created by PCI0002 on 6/11/20.
//  Copyright © 2020 LeThanhLam. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class DetailViewModel {

    //MARK: Properties
    var avatarImage: UIImage?
    var inforDic: [String: String] = [:]
    var repositories: [Repositories] = []
    var description: String = ""

    //MARK: Realm
    var login: String = ""
    var name: String = ""
    var type: String = ""
    var id: Int = 0
    var imageURL: String = ""

    var isFavoties: Bool = false

    var titles: [String] = ["Infor", "Description", "Repositories"]

    init(repo: Repositories) {
        self.avatarImage = repo.thumbnailImage

        inforDic["name"] = repo.name
        inforDic["login"] = repo.owner.login
        inforDic["id"] = "\(repo.owner.id)"
        inforDic["nodeId"] = repo.owner.nodeId
        inforDic["htmlURL"] = repo.owner.htmlURL
        inforDic["siteAdmin"] = "\(repo.owner.siteAdmin)"

        //MARK: Realm
        self.description = repo.descriptionRepo
        self.id = repo.owner.id
        self.name = repo.name
        self.login = repo.owner.login
        self.type = repo.owner.type
        self.imageURL = repo.owner.avatarUrl
    }

    //MARK: TableView Data
    func numberOfSections() -> Int {
        return 3
    }

    func numberOfRowsInSection(section: Int) -> Int {
        if section == 0 {
            return inforDic.count
        } else if section == 1 {
            return 1
        } else if section == 2 {
            return repositories.count
        }
        return 0
    }

    func inforCellViewModel(at indexPath: IndexPath) -> InforCellViewModel {
        let names = Array(inforDic.keys)
        let name = names[indexPath.row]
        let value = inforDic[name] ?? ""
        let inforCellViewModel = InforCellViewModel(name: name, value: value)

        return inforCellViewModel
    }

    func descriptionCellViewModel() -> DescriptionCellViewModel {
        let descriptionCellViewModel = DescriptionCellViewModel(description: self.description)
        return descriptionCellViewModel
    }

    func repoCellViewModel(at indexPath: IndexPath) -> HomeCellModel {
        let item = repositories[indexPath.row]
        let viewmodel = HomeCellModel(repo: item)
        return viewmodel
    }

    //MARK: Download Image
    func downloadImageCell(at indexPath: IndexPath, completion: @escaping (IndexPath, UIImage?) -> Void) {
        let item = repositories[indexPath.row]
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

    // MARK: LoadAPI
    func loadAPi(apiCompletion: @escaping (Bool, String) -> Void) {
        Networking.shared().getReposByUsers(login: self.login) { (repoUserResult) in
            switch repoUserResult {
            case .failure(let error):
                apiCompletion(false, error)
            case .success(let repoUser):
                print("abdx")
                for item in repoUser.repos {
                    self.repositories.append(item)
                }
                apiCompletion(true, "Connect Success")
            }
        }
    }

    //MARK: Realm
    func checkFavorites(checkCompletion: @escaping (Bool, String) -> Void) {
        do {
            let realm = try Realm()

            let repo = realm.objects(RepoRealm.self).filter("id = \(id) AND isFavoties = true ")
            if repo.count == 0 {
                isFavoties = false
                checkCompletion(true,"Item not is Favorites")
            } else {
                isFavoties = true
                checkCompletion(false,"Item is Favorites")
            }
        } catch { }
    }

    func addFavorites(addCompletion: @escaping (Bool, String) -> Void) {
        do {
            let realm = try Realm()

            let repo = RepoRealm()
            repo.id = id
            repo.name = name
            repo.login = login
            repo.type = type
            repo.isFavoties = true
            repo.imageURL = imageURL
            try realm.write {
                realm.add(repo)
                isFavoties = true
                addCompletion(true, "Success To Add Object")
            }
        } catch {
            addCompletion(false, "Failed To Add Object")
        }
    }

    func deleteFavorites(deleteCompletion: @escaping (Bool, String) -> Void) {
        do {
            let realm = try Realm()

            let repo = realm.objects(RepoRealm.self).filter("id = \(id)")

            try realm.write {
                realm.delete(repo)
                isFavoties = false
                deleteCompletion(true, "Success To Delete Object")
            }
        } catch {
            deleteCompletion(false, "Failed To Delete Object")
        }
    }
}

