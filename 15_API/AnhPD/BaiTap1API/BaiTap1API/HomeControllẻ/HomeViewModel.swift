//
//  HomeViewModel.swift
//  BaiTap1API
//
//  Created by PCI0012 on 6/9/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import Foundation
import UIKit

//typealias Completion = (Bool, String) -> Void

class HomeViewModel {
    var entrys: [Entry] = []
    
    func loadAPI(completion: @escaping (Bool, String) -> Void) {
        let urlString = Networking.urlString
        
        Networking.shared.request(urlString: urlString) { (apiResult: APIResult<EntryResult>) in
            switch apiResult {
            case .failure(let stringError):
                completion(false, stringError)
            case .success(let entryResult):
                let array = entryResult.entrys
                for item in array {
                    self.entrys.append(item)
                }
                completion(true, "Success")
            }
        }
    }
    
    func dowloadImage(at indexPath: IndexPath, completion: @escaping (IndexPath, UIImage?) -> Void) {
        let item = entrys[indexPath.row]
        if item.thumbnailImage == nil {
            Networking.shared.downloadImage(url: item.labelImage) { (image) in
                if let image = image {
                    item.thumbnailImage = image
                    completion(indexPath, image)
                } else {
                    completion(indexPath, nil)
                }
            }
        }
    }
    
    func numberOfRowsInSection() -> Int {
        return entrys.count
    }
    
    func viewModelCellForRowAt(indexPath: IndexPath) -> HomeCellViewModel {
        let item = entrys[indexPath.row]
        let viewModel = HomeCellViewModel(entry: item)
        return viewModel
    }
}
