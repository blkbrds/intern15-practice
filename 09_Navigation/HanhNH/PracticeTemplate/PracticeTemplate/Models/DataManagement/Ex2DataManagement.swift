//
//  Ex2DataManagement.swift
//  PracticeTemplate
//
//  Created by ANH NGUYỄN on 11/4/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import Foundation
final class Ex2DataManagement {

    enum Key: String {
        case userName = "username"
        case password = "password"
        case avatar   = "avatar"
    }

    static let shared = Ex2DataManagement()
    private init () {}

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
    func getUser(fileName: String, type: String) -> [User] {
        guard let array = NSArray(contentsOfFile: getFileDocumentPath(fileName: fileName, type: type)) else { return [] }
        var users: [User] = []
        for item in array {
            let dict = item as! NSDictionary
            let user = User(userName: dict.object(forKey: Key.userName.rawValue) as! String,
                            avatarImageView: dict.object(forKey: Key.avatar.rawValue) as? String ?? "")
            
            users.append(user)
        }
        return users
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
        let path = documentDirectory.appending("/Ex2DataManagement.plist")
        let data: [String: String] = [Key.userName.rawValue : user.userName]
        let someData = NSArray(object: data)
        if var dataSource = NSArray(contentsOfFile: path) as? [[String: String]] {
            var i = 0
            for item in dataSource {
                if item[Key.userName.rawValue] == user.userName {
                    dataSource[i][Key.userName.rawValue] = username
                    dataSource[i][Key.avatar.rawValue] = user.avatarImageView
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
