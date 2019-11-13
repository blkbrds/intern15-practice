
import Foundation

class DataManagement {
    // MARK: - Singleton
    public static var share: DataManagement = {
        let dataManagement = DataManagement()
        return dataManagement
    }()
    // MARK: - public function
    init() { }

    func getExercises(fileName: String, type: String) -> [Exercise] {
        var exercises: [Exercise] = []
        if let array = NSArray(contentsOfFile: getFileDocumentPath(fileName: fileName, type: type)) {
            for item in array {
                let dict = item as! NSDictionary
                let ex = Exercise(name: dict.object(forKey: "name") as! String,
                    description: dict.object(forKey: "description") as! String)
                exercises.append(ex)
            }
            return exercises
        }
        return exercises
    }

    // MARK: - private function
    func getFileDocumentPath(fileName: String, type: String) -> String {
        return (Bundle.main.path(forResource: fileName, ofType: type)) ?? ""
    }
}
