//
//  HomeViewModel.swift
//  baitapMVVM
//
//  Created by user on 1/21/20.
//  Copyright © 2020 VienH. All rights reserved.
//

import Foundation

typealias Completion = (Bool, String) -> Void

class HomeViewModel {
    var names: [String] = []
    var musics: [Music] = []

    func loadAPI(completion: @escaping Completion) {
        APIManager.Music.getHotMusic { (result) in
            switch result {
            case .failure(let error):
                completion(false, error.localizedDescription)
            case .success(let musicResult):
                self.musics.append(contentsOf: musicResult.musics)
                completion(true, "")
            }
        }
    }
}
