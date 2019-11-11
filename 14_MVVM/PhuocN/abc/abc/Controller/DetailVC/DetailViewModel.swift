//
//  DetailViewModel.swift
//  abc
//
//  Created by PhuocNguyen on 10/23/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

class DetailViewModel {
    
    let videoId: String
    var title: String
    var channel: String
    var isLike: Bool
    var imageVideo: UIImage
    var comment: [Comment] = []
    var isLoadingData = false
    var pageNextToken = ""
    
    
    init(video: Video, imageVideo: UIImage) {
        self.channel = video.channel
        self.title = video.title
        self.isLike = video.isFavorite 
        self.videoId = video.id
        self.imageVideo = imageVideo
        self.isLike = RealmManager.shared.realm.objects(PlayList.self).contains { $0.id == videoId }
    }
    
    func getComment(at index: Int) -> Comment {
        return comment[index]
    }
    
    func loadComment(loadMore: Bool, completed: @escaping (Bool, String) -> Void) {
        if !loadMore {
            pageNextToken = ""
        }
        //show HUD
        if !isLoadingData {
            isLoadingData = true
            ApiManager.Comment.getComment(videoId: videoId, pageToken: pageNextToken, maxResults: 10) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .failure(let error):
                    print(error.localizedDescription)
                    completed(false, error.localizedDescription)
                case .success(let commentResult):
                    if !loadMore {
                        self.comment.removeAll()
                    }
                    self.comment.append(contentsOf: commentResult.comment)
                    self.pageNextToken = commentResult.pageToken
                    completed(true, "")
                }
                self.isLoadingData = true
            }
        } else {
            // show HUD
            print("Loading")
        }
    }
    
    func changePlayList(completion: @escaping (Bool) -> ()) {
        if !isLike {
            addToPlayList(completion: completion)
        } else {
            removeToPlayList(completion: completion)
        }
    }
    
    func removeToPlayList(completion: @escaping (Bool) -> ()) {
        if let playList = RealmManager.shared.realm.objects(PlayList.self).filter({ $0.id == self.videoId }).first {
            RealmManager.shared.deleteObject(with: playList) { result in
                switch result {
                case .sucessful:
                    completion(true)
                case .failture(let error):
                    completion(false)
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func addToPlayList(completion: @escaping (Bool) -> ()) {
        if let video = RealmManager.shared.realm.objects(Video.self).filter({ $0.id == self.videoId }).first {
            let playList = PlayList(video: video)
            RealmManager.shared.addObject(with: playList) { (result) in
                switch result {
                case .sucessful:
                    completion(true)
                case .failture(let error):
                    completion(false)
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func playVideo(completion: (Bool, String, URLRequest?) -> ()) {
        guard let url = URL(string: "https://www.youtube.com/embed/\(videoId)") else {
            completion(false, "Can load this video", nil)
            return
        }
        completion(true, "", URLRequest(url: url))
    }
    
    func changeLike(completion: (Bool) -> ()) {
        isLike = !isLike
        completion(true)
    }
}
