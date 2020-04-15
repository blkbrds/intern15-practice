import Foundation

class DataManager {

    private static var sharedDataManager: DataManager = {
        let dataManger = DataManager()
        return dataManger
    }()

    class func shared() -> DataManager {
        return sharedDataManager
    }

    private init() { }

    func read() -> (String, String) {
        let email = UserDefaults.standard.string(forKey: "userName") ?? ""
        let password = UserDefaults.standard.string(forKey: "password") ?? ""
        return (email,password)
    }
    
    func save(userName: String, password: String) {
        UserDefaults.standard.set(userName, forKey: "userName")
        UserDefaults.standard.set(password, forKey: "password")
        UserDefaults.standard.synchronize()
    }
}
