//
//  Ex04DataManagement.swift
//  BaiTap11
//
//  Created by ANH NGUYỄN on 11/12/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import Foundation
final class Ex04DataManagement {
    static let share = Ex04DataManagement()
    private init() { }

    var filePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0].appending("/conVatList.plist")
    var nameFile = "conVatList"

    func setFilePlist(name: String) {
        nameFile = name
        self.filePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0].appending("/\(name).plist")
    }

    func getData() -> [String] {
        if checkExistFileDocument() {
            return getDataFromDocumentFile()
        } else {
            do {
                try copyFileToUserDocumentDirectory()
            } catch {
                print(error)
            }
            return getDataFromBundleFile()
        }
    }

    func copyFileToUserDocumentDirectory() throws {
        if let bundlePath = Bundle.main.path(forResource: nameFile, ofType: "plist") {
            let documentUrl = URL(fileURLWithPath: filePath)
            let bundleUrl = URL(fileURLWithPath: bundlePath)
            print(documentUrl)
            try FileManager.default.copyItem(at: bundleUrl, to: documentUrl)
        }
    }

    func getDataFromBundleFile() -> [String] {
        if let path = Bundle.main.path(forResource: nameFile, ofType: "plist") {
            let url = URL(fileURLWithPath: path)
            let data = try! Data(contentsOf: url)
            let plist = try! PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil)
            if let plist = plist as? [String] {
                return plist
            }
        } else {
            print("File does not exist")
        }
        return []
    }

    func getDataFromDocumentFile() -> [String] {
        let url = URL(fileURLWithPath: filePath)
        do {
            let data = try Data(contentsOf: url)
            let plist = try PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil)
            if let plist = plist as? [String] {
                return plist
            }
        } catch {
            print("Can not load data")
        }
        return []
    }

    func checkExistFileDocument() -> Bool {
        return FileManager.default.fileExists(atPath: filePath)
    }

    func saveDataToDocument(data: NSArray) {
        let status = data.write(toFile: filePath, atomically: false)
        if status {
            print("Data saved")
        } else {
            print("Error")
        }
    }
}
