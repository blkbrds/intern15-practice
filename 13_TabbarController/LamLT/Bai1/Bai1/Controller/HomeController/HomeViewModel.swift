import Foundation

class HomeViewModel {

    var userName: String = ""
    var password: String = ""

    func fetchData(completion: (Bool, String, String) -> ()) {
        let data = DataManager.shared().read()
        let userName = data.0
        let password = data.1

        if userName != "" || password != "" {
            self.userName = userName
            self.password = password
            completion(true, userName, password)
        } else {
            completion(false, "", "")
        }
    }
}
