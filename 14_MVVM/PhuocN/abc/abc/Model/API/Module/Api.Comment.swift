//
//  Api.Comment.swift
//  abc
//
//  Created by PhuocNguyen on 11/5/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import Foundation

extension ApiManager.Comment {
    struct CommentQueryString {
        static func getComments(videoId: String, pageToken: String, maxResults: Int) -> String {
//            return "https://www.googleapis.com/youtube/v3/commentThreads?key=\(Key.youtubeKey)&textFormat=plainText&part=snippet&videoId=\(videoId)s&maxResults=\(maxResults)&pageToken=\(pageToken)"
            return "https://www.googleapis.com/youtube/v3/commentThreads?key=AIzaSyBnITkXMcJvj_1dYimnnldBQnNvAN-9m3s&textFormat=plainText&part=snippet&videoId=\(videoId)&maxResults=5&pageToken=\(pageToken)"
        }
    }
    
    struct CommentResult {
        let comment: [Comment]
        let pageToken: String
    }
    
    static func getComment(videoId: String, pageToken: String, maxResults: Int, completion: @escaping APICompletion<CommentResult>) {
        let url = CommentQueryString.getComments(videoId: videoId, pageToken: pageToken, maxResults: maxResults)
        API.shared().request(urlString: url) { result in
            switch result {
            case .success(let data):
                if let data = data {
                    let json = data.convertToJSON()
                    if let items = json["items"] as? [[String: Any]],
                        let nextPageToken = json["nextPageToken"] as? String {
                        var comment: [Comment] = []
                        for item in items {
                            var dict: [String: Any] = [:]
                            dict["id"] = item["id"]
                            if let snippet = item["snippet"] as? [String: Any],
                                let topComment = snippet["topLevelComment"] as? [String: Any],
                                let commentSnippet = topComment["snippet"] as? [String: Any] {
                                dict["authorDisplayName"] = commentSnippet["authorDisplayName"]
                                dict["authorProfileImageUrl"] = commentSnippet["authorProfileImageUrl"]
                                dict["textDisplay"] = commentSnippet["textDisplay"]
                                dict["likeCount"] = commentSnippet["likeCount"]
                                dict["publishedAt"] = commentSnippet["publishedAt"]
                                dict["updatedAt"] = commentSnippet["updatedAt"]
                            }
                            comment.append(Comment(dict: dict))
                        }
                        completion(.success(CommentResult(comment: comment, pageToken: nextPageToken)))
                    }
                 }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
