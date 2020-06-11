//
//  GitDetailViewModel.swift
//  API_MVVM_2
//
//  Created by PCI0002 on 6/4/20.
//  Copyright © 2020 LeThanhLam. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class GitDetailViewModel {

    //MARK: Properties
    var avatarImage: UIImage?
    var inforGit: [String: String] = [:]
    var ownerGit: [String: String] = [:]
    var filesGit: [String: String] = [:]
    var login: String

    //MARK: Realm
    var type: String = ""
    var id: Int
    var avatarURL = ""
    var url = ""

    var isFavoties: Bool = false

    init(git: Git) {
        self.avatarImage = git.thumbnailImage

        inforGit["url"] = git.url
        inforGit["forksURL"] = git.forksURL
        inforGit["commitsUrl"] = git.commitsUrl
        inforGit["id"] = git.id
        inforGit["nodeId"] = git.nodeId
        inforGit["htmlUrl"] = git.htmlUrl
        inforGit["publiC"] = "\(git.publiC)"
        inforGit["createdAt"] = git.createdAt
        inforGit["updateAt"] = git.updateAt
        inforGit["commentsURL"] = git.commentsURL

        ownerGit["id"] = "\(git.owner.id)"
        ownerGit["nodeId"] = git.owner.nodeId
        ownerGit["htmlURL"] = git.owner.htmlURL
        ownerGit["siteAdmin"] = "\(git.owner.siteAdmin)"
        ownerGit["type"] = git.owner.type

        let filesGit1 = git.files
        for item in filesGit1 {
            filesGit["filename"] = item.fileName
            filesGit["type"] = item.type
            filesGit["language"] = item.language
            filesGit["rawUrl"] = item.rawUrl
            filesGit["size"] = "\(item.size)"
        }

        //MARK: Realm
        self.login = git.owner.login
        self.type = git.owner.type
        self.id = git.owner.id
        self.avatarURL = git.owner.avatarUrl
        self.url = git.owner.htmlURL
    }

    //MARK: TableView Data
    func numberOfSections() -> Int {
        return 3
    }

    func numberOfRowsInSection(section: Int) -> Int {
        if section == 0 {
            return ownerGit.count
        } else if section == 1 {
            return inforGit.count
        } else if section == 2 {
            return filesGit.count
        }
        return 0
    }

    func heightForHeaderInSection(section: Int) -> CGFloat {
        if section == 0 {
            return 55
        } else if section == 1 {
            return 55
        } else if section == 2 {
            return 55
        }
        return 0
    }

    func ownerCellViewModel(at indexPath: IndexPath) -> OwnerCellModel {
        let names = Array(ownerGit.keys)
        let name = names[indexPath.row]
        let value = ownerGit[name] ?? ""

        let viewmodel = OwnerCellModel(name: name, value: value)
        return viewmodel
    }

    func inforCellViewModel(at indexPath: IndexPath) -> InfoGitViewModel {
        let names = Array(inforGit.keys)
        let name = names[indexPath.row]
        let value = inforGit[name] ?? ""

        let viewmodel = InfoGitViewModel(name: name, value: value)
        return viewmodel
    }

    func fileGitViewModel(at indexPath: IndexPath) -> FileGitModel {
        let names = Array(filesGit.keys)
        let name = names[indexPath.row]
        let value = filesGit[name] ?? ""

        let viewmodel = FileGitModel(name: name, value: value)
        return viewmodel
    }

    func headerOwnerViewModel() -> OwnerHeaderModel {
        let viewmodel = OwnerHeaderModel(login: self.login, imageHeader: self.avatarImage)
        return viewmodel
    }

    //MARK: Realm
    func checkFavorites(checkCompletion: @escaping (Bool, String) -> Void) {
        do {
            let realm = try Realm()

            let repo = realm.objects(GitRealm.self).filter("id = \(id) AND isFavoties = true ")
            if repo.count == 0 {
                isFavoties = false
                checkCompletion(true, "Item not is Favorites")
            } else {
                isFavoties = true
                checkCompletion(false, "Item is Favorites")
            }
        } catch { }
    }

    func addFavorites(addCompletion: @escaping (Bool, String) -> Void) {
        do {
            let realm = try Realm()

            let git = GitRealm()
            git.id = id
            git.login = login
            git.url = url
            git.type = type
            git.isFavoties = true
            git.avatarURL = avatarURL
            try realm.write {
                realm.add(git)
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

            let git = realm.objects(GitRealm.self).filter("id = \(id)")

            try realm.write {
                realm.delete(git)
                isFavoties = false
                deleteCompletion(true, "Success To Delete Object")
            }
        } catch {
            deleteCompletion(false, "Failed To Delete Object")
        }
    }
}

