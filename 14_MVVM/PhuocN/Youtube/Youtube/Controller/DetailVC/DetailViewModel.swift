//
//  DetailViewModel.swift
//  Youtube
//
//  Created by PhuocNguyen on 11/20/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

final class DetailViewModel {
    
    let video: Video
    var rating: String?
    var isPlayList: Bool {
        return RealmManager.shared.realm.objects(PlayList.self).contains { $0.id == video.id }
    }
    private var comment: [Comment] = []
    private var isLoadingData = false
    private var pageNextToken = ""
    
    init(video: Video) {
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
            ApiManager.Comment.getComment(videoId: video.id, pageToken: pageNextToken, maxResults: 10) { [weak self] result in
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
        ApiManager.Comment.addComment(videoId: video.id, mess: mess) { result in
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
        ApiManager.Rating.rating(videoId: video.id, rating: rating) { done, error  in
            if done {
                self.rating = rating
                completion(true, "")
            } else {
                completion(false, error)
            }
        }
    }
    
    func checkRating(completed: @escaping completed) {
        ApiManager.Rating.getRating(videoId: video.id) { (ratingResult, error) in
            if let rating = ratingResult {
                self.rating = rating
                completed(true, "")
            } else {
                completed(false, error)
            }
        }
    }
    
    //MARK: -play video
    func playVideo(completion: (Bool, String, URLRequest?) -> ()) {
        guard let url = URL(string: "https://www.youtube.com/embed/\(video.id)") else {
            completion(false, "Can load this video", nil)
            return
        }
        completion(true, "", URLRequest(url: url))
    }
}