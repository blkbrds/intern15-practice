//
//  PostViewModel.swift
//  BaitapRealm2
//
//  Created by ADMIN on 8/5/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import Foundation
import RealmSwift

protocol HomeViewModelDelegate: class {
    func viewModel(_ viewModel: PostViewModel, needPerformAction action: PostViewModel.Action)
}

class PostViewModel {
    var posts: [Post] = []
    
    enum Action {
        case reloadData
    }
    var notificationToken: NotificationToken?
    weak var delegate: HomeViewModelDelegate?
    
    
    func setupObserve() {
        do {
            let realm = try Realm()
            notificationToken = realm.objects(Post.self).observe({ (change) in
                self.delegate?.viewModel(self, needPerformAction: .reloadData)
            })
        } catch {
            print("")
        }
    }
    
    func fetchData(completion: (Bool) -> ()) {
        do {
            let realm = try Realm()
            let results = realm.objects(Post.self)
            
            posts = Array(results)
            print(posts)
            completion(true)
        } catch {
            completion(false)
        }
    }
    
    func deleteAll(completion: (Bool) -> ()) {
        do {
            let realm = try Realm()
            let results = realm.objects(Post.self)
            try realm.write {
                realm.delete(results)
            }
            completion(true)
        } catch {
            completion(false)
        }
    }
    
    func numberPost() -> Int {
        posts.count
    }
    
    func postIndex(at indexPath: IndexPath) -> Post {
        return posts[indexPath.row]
    }
}
