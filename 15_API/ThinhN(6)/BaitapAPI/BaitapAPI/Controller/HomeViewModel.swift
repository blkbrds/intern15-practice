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
    static var cache: [String: UIImage] = [:]
    
    func loadNameAPI(completion: @escaping Completion) {
        Networking.shared().request { (apiResult: APIResult<DataAPIResult>) in
            switch apiResult {
            case .success(let entryResults):
                let array = entryResults.dataAPI
                for item in array {
                    self.books.append(item )
                }
                completion(true, "stringError")
            case .failure(let stringError ):
                completion(false, stringError)
                
            }
        }
        
    }
 
    func loadImage(urlString: String, completion: @escaping (UIImage?) -> Void) {
        if let image = HomeViewModel.cache[urlString] {
            completion(image)
            return
        }
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        let config = URLSessionConfiguration.default
        config.waitsForConnectivity = true
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let data = data, let image = UIImage(data: data) {
                    HomeViewModel.cache[urlString] = image
                    completion(image)
                } else {
                    completion(nil)
                }
            }
        }
        task.resume()
    }
    
    func numberOfRowsInSection() -> Int {
        return books.count
    }
    func viewModelForCell(at indexPath: IndexPath) -> HomeCellViewModel {
        let item = books[indexPath.row]
        let viewModel = HomeCellViewModel(book: item)
        return viewModel
    }
}
