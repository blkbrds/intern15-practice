//
//  RealmVideo.swift
//  Youtube
//
//  Created by PhuocNguyen on 11/21/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import Foundation
import RealmSwift

extension RealmManager.VideoRealm {
    
    static func loadAndSaveDataToRealm(with region: String, videos: [Video], completion: @escaping (RealmManager.RealmError?) -> Void) {
        if RealmManager.shared.realm.isEmpty {
            RealmManager.shared.addObjects(with: videos) { (result) in
                switch result {
                case .failture(let error):
                    completion(error)
                case .sucessful:
                    completion(nil)
                }
            }
        } else {
            let realmVideos = RealmManager.shared.fetchObject(type: Video.self, completion: nil).filter { $0.regionCode == region }
            for video in realmVideos {
                if !videos.contains(where: { $0.id == video.id }) {
                    RealmManager.shared.deleteObject(with: video) { (result) in
                        switch result {
                        case .failture(let error):
                            completion(error)
                            return
                        case .sucessful:
                            break
                        }
                    }
                }
            }
            for video in videos {
                RealmManager.shared.writeObject(action: {
                    RealmManager.shared.realm.create(Video.self, value: video, update: .modified)
                }) { (result) in
                    switch result {
                    case .failture(let error):
                        completion(error)
                    case .sucessful:
                        completion(nil)
                    }
                }
            }
        }
    }
}
