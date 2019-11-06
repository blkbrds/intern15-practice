//
//  HomeViewModel.swift
//  abc
//
//  Created by PhuocNguyen on 10/23/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit
//
//protocol HomeViewModelDelegate: class {
//    func showAlert(with message: String, type: HomeViewModel.Action)
//}

class HomeViewModel {
    
    enum Action {
        case alertError
    }
    
    var videos: [Video] = []
    var pageNextToken = ""
    //weak var delegate: HomeViewModelDelegate?
    var isLoadingData = false
    var numberOfSection: Int = 2
    var slideImages = ["Coffee 1", "Coffee 2", "Coffee 3", "Coffee 4", "Coffee 5"]
    
    func getSlideImage() -> [String] {
        return slideImages
    }
    
    func numberRowOfSection(at section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return videos.count
    }
    
    func likePlace(at index: Int, completion: (Bool) -> ()) {
        //places[index].isFavorite = !places[index].isFavorite
        completion(true)
    }
    
    func getCount() -> Int {
        return videos.count
    }
    
    func getVideo(at indexPath: IndexPath) -> Video {
        return videos[indexPath.row]
    }
    
    func loadData(loadMore: Bool, completed: @escaping (Bool, String) -> Void) {
        if !loadMore {
            pageNextToken = ""
        }
        //show HUD
        if !isLoadingData {
            isLoadingData = true
            ApiManager.Video.getVideo(token: pageNextToken, maxResult: 10) { [weak self] (result) in
                guard let self = self else { return }
                switch result {
                case .failure(let error):
                    completed(false, error.localizedDescription)
                case .success(let videoResult):
                    if !loadMore {
                        if RealmManager.shared.realm.isEmpty {
                            RealmManager.shared.addObjects(with: videoResult.videos)
                        } else {
//                            RealmManager.shared.realm.refresh()
//                            RealmManager.shared.addObjects(with: videoResult.videos)
                        }
                    } else {
                        for video in videoResult.videos {
                            RealmManager.shared.writeObject(action: {
                                RealmManager.shared.realm.create(Video.self, value: video, update: .modified)
                            })
                        }
                        
                        self.videos.append(contentsOf: videoResult.videos)
                    }
                    self.videos = RealmManager.shared.fetchObject(type: Video.self, completion: nil)
                    self.pageNextToken = videoResult.pageNextToken
                    completed(true, "")
                }
                self.isLoadingData = false
            }
        } else {
            // show HUD
            print("Loading")
        }
    }
}
