//
//  FavoriteViewModel.swift
//  abc
//
//  Created by PhuocNguyen on 11/5/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import Foundation

class FavoriteViewModel {
    var playList: [PlayList] = []
    
    func fetchDataFromRealm(comletion: @escaping (Bool) -> ()) {
        let video = RealmManager.shared.fetchObject(type: PlayList.self, completion: { (result) in
            switch result {
            case .failture( _):
                comletion(false)
                return
            case .sucessful:
                break
            }
        })
        self.playList = video
        comletion(true)
    }
    
    func getAllVideo() -> [PlayList] {
        return playList
    }
    
    func getCount() -> Int {
        return playList.count
    }
    
    func getVideo(at index: Int) -> PlayList {
        return playList[index]
    }
    
    func deleteAllLikeVideo(completion: @escaping (Bool) -> ()) {
        let playList = RealmManager.shared.fetchObject(type: PlayList.self, completion: nil)
        RealmManager.shared.deleteAllObject(with: playList) { result in
            switch result {
            case .sucessful:
                completion(true)
            case .failture(let error):
                print(error.localizedDescription)
                completion(false)
            }
        }
    }
    
    func deleteLikeVideo(index: Int, completion: @escaping (Bool) -> ()) {
        let playList = RealmManager.shared.fetchObject(type: PlayList.self, completion: nil)[index]
        RealmManager.shared.deleteObject(with: playList) { result in
            switch result {
            case .sucessful:
                completion(true)
            case .failture(let error):
                print(error.localizedDescription)
                completion(false)
            }
        }
    }
}
