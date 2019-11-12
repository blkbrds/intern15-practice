//
//  SearchDetailViewModel.swift
//  abc
//
//  Created by PhuocNguyen on 11/10/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import Foundation

final class SearchDetailViewModel {
    private var videos: [Video] = []
    private let searchKey: String
    private var pageToken: String = ""
    private var isLoading: Bool = false
    
    init(searchKey: String) {
        self.searchKey = searchKey.filter { $0 != " " }
    }
    
    func getCount() -> Int {
        return videos.count
    }
    
    func getVideo(at index: Int) -> Video {
        return videos[index]
    }
    
    func loadSearchVideo(loadMore: Bool, completed: @escaping completed) {
        if !loadMore {
            pageToken = ""
        }
        if !isLoading {
            isLoading = true
            ApiManager.Video.getSearchVideo(searchKey: searchKey, token: pageToken, maxResult: 10) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .failure(let error):
                    completed(false, error.localizedDescription)
                case .success(let resultVideo):
                    if !loadMore {
                        self.videos.removeAll()
                    }
                    self.videos.append(contentsOf: resultVideo.videos)
                    print(self.videos.count)
                    self.pageToken = resultVideo.pageNextToken
                    completed(true, "")
                }
                self.isLoading = false
            }
        } else {
            print("Done")
        }
    }
}
