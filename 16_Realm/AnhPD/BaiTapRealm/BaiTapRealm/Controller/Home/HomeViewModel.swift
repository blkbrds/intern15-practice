//
//  HomeViewModel.swift
//  BaiTapRealm
//
//  Created by PCI0012 on 6/22/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import Foundation
import RealmSwift

final class HomeViewModel {
    var items: [Item] = []
    
    func fetchData(completion: (Bool) -> Void) {
        do {
            //realm
            let realm = try Realm()
            
            //result
            let results = realm.objects(Item.self)
            
            //convert to array
            items = Array(results)
            
            //call back
            completion(true)
        } catch {
            //call back
            completion(false)
        }
    }
    
    func add(id: Int, title: String, subTitle: String) {
        do {
            //tao realm
            let realm = try Realm()
            //tao 1 item
            let item = Item()
            item.id = id
            item.title = title
            item.subTitle = subTitle
            
            //realm write
            try realm.write {
                realm.add(item)
            }
        } catch {
            print("Error")
        }
    }
    
    func getNextId() -> Int {
        var nextValue: Int = 1
        do {
            //tao realm
            let realm = try Realm()
            if let maxValue =  realm.objects(Item.self).max(ofProperty: "id") as Int? {
                // Do some stuff
                nextValue = maxValue + 1
            }
        } catch {
            print("Error")
        }
        return nextValue
    }
    
    func update(id: Int, title: String, subTitle: String) {
        do {
            //tao realm
            let realm = try Realm()
            
            var item: Item = Item()
            item.id = id
            item.title = title
            item.subTitle = subTitle

            try realm.write {
                realm.add(item, update: Realm.UpdatePolicy.modified)
            }
        } catch {
            print("Error")
        }
    }
    
    func delete() {
        do {
            let realm = try Realm()
            
            try realm.write {
                realm.delete(items)
            }
        } catch {
            print("Error")
        }
    }
    
    
    func getItem(at indexPath: Int) -> Item {
        return items[indexPath]
    }
    
    func numberOfRowsInSection() -> Int {
        return items.count
    }
    
    func viewModelCellForRowAt(indexPath: Int) -> HomeCellViewModel {
        let item = items[indexPath]
        let viewModel = HomeCellViewModel(item: item)
        return viewModel
    }
    
    func viewModelDidSelectRowAt(indexPath: Int) -> ChangeViewModel {
        let item = items[indexPath]
        let viewModel = ChangeViewModel(item: item)
        return viewModel
    }
}
