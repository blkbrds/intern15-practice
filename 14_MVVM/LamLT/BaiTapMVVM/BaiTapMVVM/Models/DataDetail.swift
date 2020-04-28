import Foundation

final class DataDetail {
    //MARK: - Properties
    var name: String
    var image: String
    var comment: String
    var time: String
    
    //MARK: - Init
    init(name: String = "", image: String = "", comment: String = "", time: String = "") {
        self.name = name
        self.image = image
        self.comment = comment
        self.time = time
    }
}
