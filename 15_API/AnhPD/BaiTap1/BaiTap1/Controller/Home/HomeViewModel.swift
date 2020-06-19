//
//  HomeViewModel.swift
//  BaiTap1
//
//  Created by PCI0012 on 6/5/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import Foundation

typealias Completion = (Bool, String) -> Void

class HomeViewModel {
    var musics: [Music] = []
    
    func loadAPI2(completion: @escaping Completion) {
        let urlString = Networking.urlString
        Networking.shared().request(with: urlString) { (data, error) in
            if let error = error {
                completion(false, error.localizedDescription)
            } else {
                if let data = data {
                    let json = data.toJSON()
                    let feed = json["feed"] as! JSON
                    let results = feed["results"] as! [JSON]
                    
                    for item in results {
                        let music = Music(json: item)
                        self.musics.append(music)
                    }
                    
                    completion(true, "")
                } else {
                    completion(false, "Data format is error")
                }
            }
        }
    }
    
    func numberOfRowsInSection() -> Int {
        return musics.count
    }
    
    func viewModelCellForAtRow(indexPath: IndexPath) -> HomeCellViewModel {
        let item = musics[indexPath.row]
        let viewModel = HomeCellViewModel(music: item)
        return viewModel
    }
}

