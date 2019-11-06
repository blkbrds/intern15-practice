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
    }
    
    func getComment(at index: Int) -> Comment {
        return comment[index]
    }
    
    func loadData(loadMore: Bool, completed: @escaping (Bool, String) -> Void) {
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
    
    func likeVideo(completion: @escaping (Bool) -> ()) {
        let isFavorite = isLike
        RealmManager.shared.writeObject(action: {
            RealmManager.shared.realm.create(Video.self, value: ["id": videoId, "isFavorite": !isFavorite], update: .modified)
        }) { (result) in
            switch result {
            case .sucessful:
                completion(true)
            case .failture(let error):
                completion(false)
                print(error.localizedDescription)
            }
        }
    }
    
    func changeLike() {
        isLike = !isLike
    }
}
