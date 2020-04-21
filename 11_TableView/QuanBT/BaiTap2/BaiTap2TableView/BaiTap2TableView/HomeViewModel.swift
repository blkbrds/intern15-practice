//
//  HomeViewModel.swift
//  BaiTap2TableView
//
//  Created by Sếp Quân on 4/7/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import Foundation

final class HomeViewModel {
    // MARK: - IBOutlet
    var contactsData: [String] = []
    
    // MARK: - Function
    func getData() {
        guard let path = Bundle.main.url(forResource: "name", withExtension: "plist") else {
            return
        }
        guard let data = NSArray(contentsOf: path) else {
            return
        }
        contactsData = data as! [String]
    }
    
    func numberOfRowsInSection(in section: Int) -> Int {
        return contactsData.count
    }
    
    func viewModelForCell(at indexPath: IndexPath) -> String {
        let item = contactsData[indexPath.row]
        return item
    }
}
