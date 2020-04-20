import Foundation

class DataManager {
    var name: String
    var image: String
    var address: String
    var range: String
    var rate: String
    var favorite: Bool
    
    init(name: String = "", image: String = "", address: String = "", range: String = "", rate: String = "", favorite: Bool = false) {
        self.name = name
        self.image = image
        self.address = address
        self.range = range
        self.rate = rate
        self.favorite = favorite
    }
}

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
