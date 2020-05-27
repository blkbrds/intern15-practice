import Foundation

class LoginViewModel {

    enum LoginResult {
        case success
        case failure(Bool, String)
    }

    typealias Completion = (LoginResult) -> Void

    var userName: String = "qwe"
    var password: String = "123456"

    init(userName: String, password: String) {
        self.userName = userName
        self.password = password
    }

    func login(userName: String, password: String, completion: Completion) {
        if userName == "" || password == "" {
            completion(.failure(true, "UserName or Password incoret"))
        } else {
            self.userName = ""
            self.password = ""

            DataManager.shared().save(userName: userName, password: password)

            completion(.success)
        }
    }
}
