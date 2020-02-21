import Foundation

enum UserDefaultKeys: String {
    case userName = "username"
    case password = "password"
}

final class DataManagement {

    public static var shared: DataManagement = {
        let dataManagement = DataManagement()
        return dataManagement
    }()
    
    init() {}

    func getUsers(fileName: String, type: String) -> [User] {
        guard let array = NSArray(contentsOfFile: getFileDocumentPath(fileName: fileName, type: type)) else { return [] }
        var users: [User] = []
        for item in array {
            guard let dict = item as? Dictionary<String, String>, let password = dict[UserDefaultKeys.password.rawValue], let userName = dict[UserDefaultKeys.userName.rawValue]  else { continue }
            let user = User(userName: userName, password: password)
            users.append(user)
        }
        return users
    }
    
    func getFileDocumentPath(fileName: String, type: String) -> String {
        return (Bundle.main.path(forResource: fileName, ofType: type)) ?? ""
    }
}
