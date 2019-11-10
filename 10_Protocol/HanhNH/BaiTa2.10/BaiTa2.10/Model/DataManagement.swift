//
//  DataManagement.swift
//  BaiTa2.10
//
//  Created by ANH NGUYỄN on 11/6/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import Foundation
enum key: String {
    case userName = "username"
    case avatar = "avatar"
}

class DataManagement {
    
    public static var share: DataManagement = {
        let dataManagement = DataManagement()
        return dataManagement
    }()
    
    private init() {}
    
    func getUser(fileName: String, type: String) -> [User] {
        guard let arry = NSArray(contentsOfFile:getFileDocumentPath(fileName: fileName, type: type) ) else {return []}
        var users: [User] = []
        for item in arry {
            if let dict = item as? NSDictionary {
                let user = User(userName: dict.object(forKey: key.userName.rawValue) as! String,
                                avatarImageName: dict.object(forKey: key.avatar.rawValue) as! String)
                users.append(user)
            }
        }
        return users
    }
    func getFileDocumentPath(fileName: String, type: String) -> String {
        guard let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first else { return "" }
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
    func writePlistToList(user: User, username: String) {
        guard let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first else { return }
            let path = documentDirectory.appending("/Property.plist")
            let data: [String: String] = [key.userName.rawValue : user.userName, key.avatar.rawValue: user.avatarImageName]
            let someData = NSArray(object: data)
            if var dataSource = NSArray(contentsOfFile: path) as? [[String: String]] {
                var i = 0
                for item in dataSource {
                    if item[key.userName.rawValue] == user.userName {
                        dataSource[i][key.userName.rawValue] = username
                        dataSource[i][key.avatar.rawValue] = user.avatarImageName
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
