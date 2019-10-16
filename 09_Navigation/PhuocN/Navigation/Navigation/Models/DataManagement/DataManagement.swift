//
//  DataManagement.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import Foundation

class DataManagement {
    // MARK: - Signleton
    public static var share: DataManagement = {
        let dataManagement = DataManagement()
        return dataManagement
    }()
    // MARK: - public function
     private init() {}
    
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
    
    func getUser(fileName: String, type: String) -> [User] {
        guard let array = NSArray(contentsOfFile: getFileDocumentPath(fileName: fileName, type: type)) else { return [] }
        var users: [User] = []
        for item in array {
            let dict = item as! NSDictionary
            let user = User(username: dict.object(forKey: "username") as! String,
                            password: dict.object(forKey: "password") as! String,
                            avatarImageName: dict.object(forKey: "avatar") as! String)
            users.append(user)
        }
        return users
    }
    
    // MARK: - private function   
    func getFileDocumentPath(fileName: String, type: String) -> String {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let url = NSURL(fileURLWithPath: path)
        print(url)
        if let pathComponent = url.appendingPathComponent("\(fileName).\(type)") {
            let filePath = pathComponent.path
            let fileManager = FileManager.default
            if fileManager.fileExists(atPath: filePath) {
                print(filePath)
                return filePath
            } else {
                return (Bundle.main.path(forResource: fileName, ofType: type)) ?? ""
            }
        } else {
            return (Bundle.main.path(forResource: fileName, ofType: type)) ?? ""
        }
    }
    
    func preparePlistForObject(forResource: String, ofType: String, withURL plistURL: String) {
        guard let rootPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, .userDomainMask, true).first else { return }
        let plistPathInDoc = rootPath.appendingFormat(plistURL)
        if !FileManager.default.fileExists(atPath: plistPathInDoc) {
            guard let plistPathInBunble = Bundle.main.path(forResource: forResource, ofType: ofType) else { return }
            do {
                try FileManager.default.copyItem(atPath: plistPathInBunble, toPath: plistPathInDoc)
            } catch (let err) {
                print("Error: \(err.localizedDescription)")
            }
        }
    }
    
    func writePlistToList(user: User, username: String, password: String? = nil) {
        let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let path = documentDirectory.appending("/users.plist")
        let data: [String: String] = ["username" : user.username, "password" : user.password, "avatar": user.avatarImageName]
        let someData = NSArray(object: data)
        if var dataSource = NSArray(contentsOfFile: path) as? [[String: String]] {
            var i = 0
            for item in dataSource {
                if item["username"] == user.username {
                    dataSource[i]["username"] = username
                    if let password = password {
                        dataSource[i]["password"] = password
                    } else {
                        dataSource[i]["password"] = user.password
                    }
                    dataSource[i]["avatar"] = user.avatarImageName
                    print(dataSource[i])
                }
                i += 1
            }
            (dataSource as NSArray).write(toFile: path, atomically: true)
        } else {
            let isWritten = someData.write(toFile: path, atomically: true)
            print("is the file created: \(isWritten)")
        }
    }
}