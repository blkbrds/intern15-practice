//
//  Ex2DataManagement.swift
//  Protocol
//
//  Created by PCI0018 on 11/5/19.

import Foundation

final class Ex2DataManagement {

    static let share = Ex2DataManagement()
    private init() { }

    let filePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0].appending("/Profiles.plist")
    let nameFile = "Profiles"

    // MARK: - Read data from plist file
    func getData() -> [Dictionary<String, String>] {
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

    func getDataFromBundleFile() -> [Dictionary<String, String>] {
        if let path = Bundle.main.path(forResource: nameFile, ofType: "plist") {
            let url = URL(fileURLWithPath: path)
            let data = try! Data(contentsOf: url)
            let plist = try! PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil)
            if let plist = plist as? [Dictionary<String, String>] {
                return plist
            }
        } else {
            print("File does not exist")
        }
        return []
    }

    func getDataFromDocumentFile() -> [Dictionary<String, String>] {
        let url = URL(fileURLWithPath: filePath)
        do {
            let data = try Data(contentsOf: url)
            let plist = try PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil)
            if let plist = plist as? [Dictionary<String, String>] {
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

    // MARK: - Save data to file in document
    func saveDataToDocument(data: NSArray) {
        let status = data.write(toFile: filePath, atomically: false)
        if status {
            print("Data saved")
        } else {
            print("Error")
        }
    }

    func saveDataToDocument(data: [ProfileData], currentName: String, newName: String) {
        let mutables = NSMutableArray()
        for item in data {
            let dictionary = NSMutableDictionary()
            if item.name == currentName {
                dictionary.setValue(newName, forKey: "name")
            } else {
                dictionary.setValue(item.name, forKey: "name")
            }
            dictionary.setValue(item.avatarString, forKey: "avatarString")
            mutables.add(dictionary)
        }
        saveDataToDocument(data: mutables)
    }
}
