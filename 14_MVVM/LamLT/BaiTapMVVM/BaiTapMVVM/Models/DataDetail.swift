import Foundation

final class DataDetail {
    var name: String
    var image: String
    var comment: String
    var time: String
    
    init(name: String = "", image: String = "", comment: String = "", time: String = "") {
        self.name = name
        self.image = image
        self.comment = comment
        self.time = time
    }
}
