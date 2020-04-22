//
//  HomeViewModel.swift
//  BaiTapDemoRealm
//
//  Created by Sếp Quân on 4/19/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import Foundation
import RealmSwift

final class HomeViewModel {
    // MARK: - Properties
    var datas: [Category] = []
    
    // MARK: - Function
    func numberOfRowInSection() -> Int {
        return datas.count
    }
    
    func viewModelForCell(at indexPath: IndexPath) -> HomeCellModel {
        let item = datas[indexPath.row]
        let viewModel = HomeCellModel(data: item)
        return viewModel
    }
    
    func fetchData(completion: (Bool) -> ()) {
        do {
            // realm
            let realm = try Realm()
            // results
            let results = realm.objects(Category.self)
            
            // convert to array
            datas = Array(results)
            
            // call back
            completion(true)
            
        } catch {
            // call back
            completion(false)
        }
    }
    
    func addData(title: String, type: Int) {
        // tạo realm
        let realm = try! Realm()
        let results = realm.objects(Category.self)
        // tạo 1 category
        let category = Category()
        category.title = title
        category.count = results.count
        category.type = type
        
        //realm write
        try! realm.write {
            realm.add(category)
        }
    }
    
    func deleteAll(completion: (Bool) -> ()) {
        do {
            // realm
            let realm = try Realm()
            
            // results
            let results = realm.objects(Category.self)
            
            // delete all items
            try realm.write {
                realm.delete(results)
            }
            
            // call back
            completion(true)
            
        } catch {
            // call back
            completion(false)
        }
    }
    
    func deleteItem(item: String) {
        do {
            // realm
            let realm = try Realm()
            
            // results
            let results = realm.objects(Category.self).filter("count == \(item)")
            
            // delete all items
            try realm.write {
                realm.delete(results)
            }
        } catch {
            print("Lỗi xoá item")
        }
    }
}
