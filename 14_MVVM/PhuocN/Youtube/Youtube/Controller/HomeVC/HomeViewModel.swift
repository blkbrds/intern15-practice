//
//  HomeViewModel.swift
//  abc
//
//  Created by PhuocNguyen on 10/23/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

final class HomeViewModel {
    
    enum Action {
        case alertError
    }
    
    var videosDict: [String: [Video]] = [:]
    var videos: [Video] = []
    var pageNextToken = ""
    var regions = Region.regions
    var isLoadingData = false
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
    
    func getCount() -> Int {
        return videos.count
    }
    
    func numberOfSection() -> Int {
        return regions.count
    }
    
    func getRegionTitle(at section: Int) -> String {
        return regions[section].title
    }
    
    func getNumberRowAtSection(_ section: Int) -> Int {
        return videosDict[regions[section].code]?.count ?? 0
    }
    
    func getVideo(at indexPath: IndexPath) -> Video? {
        return videosDict[regions[indexPath.section].code]?[indexPath.row]
    }
    
    func loadAndSaveDataToRealm(with region: String, videos: [Video], completed: @escaping completed) {
        RealmManager.VideoRealm.loadAndSaveDataToRealm(with: region, videos: videos) { [weak self] (error) in
            guard let self = self else { return }
            if let error = error {
                completed(false, error.localizedDescription)
            } else {
                self.videosDict[region] = videos
                completed(true, "")
            }
        }
    }
    
    func loadMoreAndSaveToRealm(with videos: [Video]) {
        for video in videos {
            RealmManager.shared.writeObject(action: {
                RealmManager.shared.realm.create(Video.self, value: video, update: .modified)
            })
        }
        self.videos.append(contentsOf: videos)
    }
    
    func loadAllVideo(completed: @escaping completed) {
        let downloadGroup = DispatchGroup()
        var storedError: APIError?
        for region in regions {
            downloadGroup.enter()
            ApiManager.Video.getVideo(token: pageNextToken, maxResult: 5, regionCode: region.code) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let videoResult):
                    self.loadAndSaveDataToRealm(with: region.code, videos: videoResult.videos, completed: completed)
                case .failure(let error):
                    self.videosDict[region.code] = RealmManager.shared.fetchObject(type: Video.self, completion: nil).filter { $0.regionCode == region.code }
                    storedError = error
                }
                downloadGroup.leave()
            }
        }
        downloadGroup.notify(queue: DispatchQueue.main) {
            if let error = storedError {
                completed(false, error.localizedDescription)
            }
            print("--> videos: ", self.videos)
        }
    }
}
