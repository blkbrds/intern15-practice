//
//  SectionViewModel.swift
//  BaiTap9_9'TableView
//
//  Created by Sếp Quân on 4/6/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import Foundation

final class SectionViewModel {
    // MARK: - Properties
    var users: [[User]] = []
    
    // MARK: - Function
    func numberOfSection() -> Int {
        users.count
    }
    
    func numberOfRowInSection(in section: Int) -> Int {
        return users[section].count
    }
    
    func viewModelForCell(at indexPath: IndexPath) -> HomeCellModel {
        let item = users[indexPath.section][indexPath.row]
        let viewModel = HomeCellModel(user: item)
        return viewModel
    }
    
     func getUser() {
        var users: [[User]] = []
        guard let path = Bundle.main.url(forResource: "Sections", withExtension: "plist") else {
            return         }
        guard let data = NSArray(contentsOf: path) as? [[String]] else {
            return
        }
        
        for index1 in 0 ..< data.count {
            var userNames = [User]()
            for index2 in 0 ..< data[index1].count {
                let user = User(name: data[index1][index2], image: "avatar", title: "Sub title")
                userNames.append(user)
            }
            users.append(userNames)
        }
        self.users = users
    }
}
