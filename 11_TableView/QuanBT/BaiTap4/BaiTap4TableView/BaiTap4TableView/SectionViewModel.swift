//
//  SectionViewModel.swift
//  BaiTap4TableView
//
//  Created by Sếp Quân on 4/7/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import Foundation

final class SectionViewModel {
    // MARK: - IBOutlet
       var plants: [[String]] = []
       
       // MARK: - Function
       func getData() {
           guard let path = Bundle.main.url(forResource: "Sections", withExtension: "plist") else {
               return
           }
           guard let data = NSArray(contentsOf: path) else {
               return
           }
           plants = data as! [[String]]
       }
       
       func numberOfSections() -> Int {
           return plants.count
       }
       
       func numberOfRowsInSection(in section: Int) -> Int {
           return plants[section].count
       }
       
       func viewModelForCell(at indexPath: IndexPath) -> String {
           let item = plants[indexPath.section][indexPath.row]
           return item
       }
    
}
