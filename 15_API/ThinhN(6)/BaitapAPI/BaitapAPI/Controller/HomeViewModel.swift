//
//  HomeViewModel.swift
//  BaitapAPI
//
//  Created by ADMIN on 8/11/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import Foundation
import UIKit

typealias Completion = (Bool, String) -> Void

class HomeViewModel {
    var books: [Book] = []
    
    func loadNameAPI(completion: @escaping Completion) {
        let urlString = Networking.urlString
        Networking.shared().request(with: urlString) { (data, error) in
            if let error = error {
                completion(false, error.localizedDescription)
            } else {
                if let data = data {
                    let json = data.toJSON()
                    guard let feed = json["feed"] as? JSON, let entry = feed["entry"] as? [JSON] else { return }
                    for item in entry {
                        let book = Book(json: item)
                        self.books.append(book)
                    }
                    completion(true,"")
                } else {
                    completion(false, "Data format is error")
                }
            }
        }
    }
    func numberOfRowsInSection() -> Int {
        return books.count
    }
}
