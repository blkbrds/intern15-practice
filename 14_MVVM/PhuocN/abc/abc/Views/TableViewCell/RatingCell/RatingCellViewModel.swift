//
//  RatingCellViewModel.swift
//  abc
//
//  Created by PhuocNguyen on 11/11/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import Foundation

final class RatingCellViewModel {
    var rating: (like: Bool, disLike: Bool)
    var isPlayList: Bool
    let video: Video?

    private var id: String {
        if let video = video {
            return video.id
        }
        return ""
    }
    
    init(video: Video, rating: String, isPlayList: Bool) {
        switch rating {
        case "like":
            self.rating = (true, false)
        case "dislike":
            self.rating = (false, true)
        default:
            self.rating = (false, false)
        }
        self.isPlayList = isPlayList
        self.video = video
    }
    
    func changePlayList(completion: @escaping (Bool, String) -> ()) {
        if !isPlayList {
            addToPlayList(completion: completion)
        } else {
            removeToPlayList(completion: completion)
        }
    }
    
    private func removeToPlayList(completion: @escaping (Bool, String) -> ()) {
        if let video = video, let playList = RealmManager.shared.realm.objects(PlayList.self).filter({ $0.id == video.id }).first {
            RealmManager.shared.deleteObject(with: playList) { result in
                switch result {
                case .sucessful:
                    completion(true, "")
                case .failture(let error):
                    completion(false, error.localizedDescription)
                }
            }
        }
    }
    
    private func addToPlayList(completion: @escaping (Bool, String) -> ()) {
        if let video = video {
            let playList = PlayList(video: video)
            RealmManager.shared.addObject(with: playList) { (result) in
                switch result {
                case .sucessful:
                    completion(true, "")
                case .failture(let error):
                    completion(false, error.localizedDescription)
                }
            }
        }
    }
}
