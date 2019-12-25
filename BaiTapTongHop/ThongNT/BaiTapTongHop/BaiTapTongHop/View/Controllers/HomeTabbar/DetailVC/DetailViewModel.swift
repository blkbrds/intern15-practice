//
//  DetailViewModel.swift
//  BaiTapTongHop
//
//  Created by PCI0018 on 11/28/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import Foundation

final class DetailViewModel {
    
    private var googlePlace = GooglePlace()
    var indexOfItem: Int = 0
    private var imageURLs: [String] = []
    
    init() {}
    
    init(googlePlace: GooglePlace) {
        self.googlePlace = googlePlace
    }
    
    func setImageURLs(with imageURLs: [String]) {
        self.imageURLs = imageURLs
        print(imageURLs)
    }
    
    func getImageURLs() -> [String] {
        return imageURLs
    }
    
    func loadImageURLs(completed: @escaping (Bool, [String]) -> Void) {
        ApiManager.Places.getPlaceImages(idPlace: googlePlace.idPlace) { (result) in
            switch result {
            case .failure(let errorString):
                completed(false, [errorString.localizedDescription])
            case .success(let imageURLs):
                completed(true, imageURLs.imageStrings)
            }
        }
    }
}
