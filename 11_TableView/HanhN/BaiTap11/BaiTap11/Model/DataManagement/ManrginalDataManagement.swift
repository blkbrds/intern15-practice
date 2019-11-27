//
//  ManrginalDataManagement.swift
//  BaiTap11
//
//  Created by ANH NGUYỄN on 11/27/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import Foundation
final class ManrginalDataManagement {
    public static var share: ManrginalDataManagement = {
        let dataManagement = ManrginalDataManagement()
        return dataManagement
    }()

    init() {

    }

    func getExercises(fileName: String, type: String) -> [Account] {
        let array = NSArray(contentsOfFile: getFileDocumentPath(fileName: fileName, type: type))
        var exercises: [Account] = []
        for item in array! {
            let dict = item as! NSDictionary
            let Ac = Account(name: dict.object(forKey: "name") as! String, image: dict.object(forKey: "image") as! String, subtile: dict.object(forKey: "subtile") as! String)
            exercises.append(Ac)
        }
        return exercises
    }

    func getFileDocumentPath(fileName: String, type: String) -> String {
        return (Bundle.main.path(forResource: fileName, ofType: type)) ?? ""
    }
}
