//
//  DataManagement.swift
//  BaiTap11
//
//  Created by ANH NGUYỄN on 11/11/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import Foundation
final class DataManagement {
     public static var share: DataManagement = {
           let dataManagement = DataManagement()
           return dataManagement
       }()

       // MARK: - public function
       init() {
       }

       func getExercises(fileName: String, type: String) -> [Exercise] {
           let array = NSArray(contentsOfFile: getFileDocumentPath(fileName: fileName, type: type))
           var exercises: [Exercise] = []
           for item in array! {
               let dict = item as! NSDictionary
               let ex = Exercise(name: dict.object(forKey: "name") as! String,
                                 description: dict.object(forKey: "description") as! String)
               exercises.append(ex)
           }
           return exercises
       }

//       func getAnimals(fileName: String, type: String) -> [Animal] {
//           let array = NSArray(contentsOfFile: getFileDocumentPath(fileName: fileName, type: type))
//           var animals: [Animal] = []
//           for item in array! {
//               let dict = item as! NSDictionary
//               let animal = Animal(name: dict.object(forKey: "name") as! String,
//                                 descript: dict.object(forKey: "description") as! String, avatar: dict.object(forKey: "avatar") as! String)
//               animals.append(animal)
//           }
//           return animals
//       }

       func getUser(fileName: String, type: String) -> [User] {
           let array = NSArray(contentsOfFile: getFileDocumentPath(fileName: fileName, type: type))
           var users: [User] = []
           for item in array! {
               let dict = item as! NSDictionary
               let user = User(name: dict.object(forKey: "name") as! String)
               users.append(user)
           }
           return users
       }

       func getContacts(fileName: String, type: String) -> [String] {
           let array = NSArray(contentsOfFile: getFileDocumentPath(fileName: fileName, type: type))
           var contacts: [String] = []
           for item in array! {
               let dict = item as! NSDictionary
               let contact = dict.object(forKey: "name") as! String
               contacts.append(contact)
           }
           return contacts
       }

       // MARK: - private function
       func getFileDocumentPath(fileName: String, type: String) -> String {
           return (Bundle.main.path(forResource: fileName, ofType: type)) ?? ""
       }
}

