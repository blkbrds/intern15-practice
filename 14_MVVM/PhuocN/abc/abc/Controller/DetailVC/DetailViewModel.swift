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
    let video: Video
    var comment: [Comment] = []
    var isLoadingData = false
    var pageNextToken = ""
    var rating: String?
    
    init(video: Video) {
        self.channel = video.channel
        self.title = video.title
        self.videoId = video.id
        self.video = video
    }
    
    func getComment(at index: Int) -> Comment {
        return comment[index]
    }
    
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
    
    
    
    func getCommentCount() -> Int {
        return comment.count
    }
}

//MARK: -Api request
extension DetailViewModel {
    
    //MARK: -comment
    func loadComment(loadMore: Bool, completed: @escaping completed) {
        if !loadMore {
            pageNextToken = ""
        }
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
                    completed(true, "")
                }
                self.isLoadingData = false
            }
        } else {
            // show HUD
            print("Loading")
        }
    }
    
    func addComment(mess: String, completion: @escaping completed) {
        ApiManager.Comment.addComment(videoId: videoId, mess: mess) { result in
            switch result {
            case .failure(let error):
                completion(false, error.localizedDescription)
            case .success(let commentResult):
                if let comment = commentResult.comment.first {
                    self.comment.insert(comment, at: 0)
                    completion(true, "")
                } else {
                    completion(false, "Comment is not load")
                }
            }
        }
    }
    
    //MARK: -rating
    func ratingVideo(rating: String, completion: @escaping completed) {
        ApiManager.Rating.rating(videoId: videoId, rating: rating) { done, error  in
            if done {
                self.rating = rating
                completion(true, "")
            } else {
                completion(false, error)
            }
        }
    }
    
    func checkRating(completed: @escaping completed) {
          ApiManager.Rating.getRating(videoId: videoId) { (ratingResult, error) in
              if let rating = ratingResult {
                  self.rating = rating
                  completed(true, "")
              } else {
                  completed(false, error)
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
}
