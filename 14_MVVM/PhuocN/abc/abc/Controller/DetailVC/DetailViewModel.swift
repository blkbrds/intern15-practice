//
//  DetailViewModel.swift
//  abc
//
//  Created by PhuocNguyen on 10/23/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

class DetailViewModel {
    
    var isPlayList: Bool {
        return RealmManager.shared.realm.objects(PlayList.self).contains { $0.id == videoId }
    }
    let videoId: String
    var title: String
    var channel: String
    var imageVideo: UIImage
    var comment: [Comment] = []
    var isLoadingData = false
    var pageNextToken = ""
    var rating: String?
    
    init(video: Video, imageVideo: UIImage) {
        self.channel = video.channel
        self.title = video.title
        self.videoId = video.id
        self.imageVideo = imageVideo
    }
    
    func getComment(at index: Int) -> Comment {
        return comment[index]
    }
    
    func checkRating(completed: @escaping (Bool, String) -> Void) {
        ApiManager.Rating.getRating(videoId: videoId) { (ratingResult, error) in
            if let rating = ratingResult {
                self.rating = rating
                completed(true, "")
            } else {
                completed(false, error)
            }
        }
    }
    
    func loadComment(loadMore: Bool, completed: @escaping (Bool, String) -> Void) {
        if !loadMore {
            pageNextToken = ""
        }
        //isLoadingData = false
        if !isLoadingData {
            isLoadingData = true
            ApiManager.Comment.getComment(videoId: videoId, pageToken: pageNextToken, maxResults: 10) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .failure(let error):
                    completed(false, error.localizedDescription)
                case .success(let commentResult):
                    if !loadMore {
                        self.comment.removeAll()
                    }
                    self.comment.append(contentsOf: commentResult.comment)
                    self.pageNextToken = commentResult.pageToken
                    print(self.pageNextToken)
                    completed(true, "")
                }
                self.isLoadingData = false
            }
        } else {
            // show HUD
            print("Loading")
        }
    }
    
//    func changePlayList(completion: @escaping (Bool) -> ()) {
//        if !isPlayList {
//            addToPlayList(completion: completion)
//        } else {
//            removeToPlayList(completion: completion)
//        }
//    }
//
//    func removeToPlayList(completion: @escaping (Bool) -> ()) {
//        if let playList = RealmManager.shared.realm.objects(PlayList.self).filter({ $0.id == self.videoId }).first {
//            RealmManager.shared.deleteObject(with: playList) { result in
//                switch result {
//                case .sucessful:
//                    completion(true)
//                case .failture(let error):
//                    completion(false)
//                    print(error.localizedDescription)
//                }
//            }
//        }
//    }
//
//    func addToPlayList(completion: @escaping (Bool) -> ()) {
//        if let video = RealmManager.shared.realm.objects(Video.self).filter({ $0.id == self.videoId }).first {
//            let playList = PlayList(video: video)
//            RealmManager.shared.addObject(with: playList) { (result) in
//                switch result {
//                case .sucessful:
//                    completion(true)
//                case .failture(let error):
//                    completion(false)
//                    print(error.localizedDescription)
//                }
//            }
//        }
//    }
//
    func playVideo(completion: (Bool, String, URLRequest?) -> ()) {
        guard let url = URL(string: "https://www.youtube.com/embed/\(videoId)") else {
            completion(false, "Can load this video", nil)
            return
        }
        completion(true, "", URLRequest(url: url))
    }
//
//    func changeLike(completion: (Bool) -> ()) {
//        isPlayList = !isPlayList
//        completion(true)
//    }
    
    func getNumberOfSection() -> Int {
        return 2
    }
    
    func numberRowOfSection(at section: Int) -> Int {
        if section == 0 {
            return 2
        } else {
            return comment.count
        }
    }
    
    func titleOfSection(for section: Int) -> String? {
        if section == 1 {
            return "Comments"
        }
        return nil
    }
    
    func ratingVideo(rating: String, completion: @escaping (Bool, String) -> ()) {
        ApiManager.Rating.rating(videoId: videoId, rating: rating) { done, error  in
            if done {
                self.rating = rating
                print(rating, "rating")
                completion(true, "")
            } else {
                self.rating = rating
                completion(false, error)
            }
        }
    }
    
    func getCommentCount() -> Int {
        return comment.count
    }
}
