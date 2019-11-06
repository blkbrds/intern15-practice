//
//  FavoriteViewModel.swift
//  abc
//
//  Created by PhuocNguyen on 11/5/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import Foundation

class FavoriteViewModel {
    var videos: [Video] = []
    
    func fetchDataFromRealm(comletion: @escaping (Bool) -> ()) {
        let video = RealmManager.shared.fetchObject(type: Video.self, completion: { (result) in
            switch result {
            case .failture( _):
                comletion(false)
                return
            case .sucessful:
                break
            }
        }).filter { $0.isFavorite }
        self.videos = video
        comletion(true)
    }
    
    func getAllVideo() -> [Video] {
        return videos
    }
    
    func getCount() -> Int {
        return videos.count
    }
    
    func getVideo(at index: Int) -> Video {
        return videos[index]
    }
    
    func deleteAllLikeVideo(completion: @escaping (Bool) -> ()) {
        RealmManager.shared.writeObject(action: {
            for video in videos {
                RealmManager.shared.realm.create(Video.self, value: ["id": video.id, "isFavorite": false], update: .modified)
            }
        }) { (result) in
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
        RealmManager.shared.writeObject(action: {
            RealmManager.shared.realm.create(Video.self, value: ["id": videos[index].id, "isFavorite": false], update: .modified)
        }) { (result) in
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
