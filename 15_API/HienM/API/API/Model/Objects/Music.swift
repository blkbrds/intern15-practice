import Foundation
import UIKit

final class Music {
    var id: String
    var artistName: String
    var releaseDate: String
    var name: String
    var artworkUrl100: String
    var thumbnailImage: UIImage?
    
    init(json: JSON) {
        self.id = json["id"] as! String
        self.artistName = json["artistName"] as! String
        self.releaseDate = "" //json["releaseDate"] as! String
        self.name = json["name"] as! String
        self.artworkUrl100 = json["artworkUrl100"] as! String
    }
}
