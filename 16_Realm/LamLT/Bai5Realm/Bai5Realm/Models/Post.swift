import Foundation
import RealmSwift

final class Post: Object {
    @objc dynamic var title = ""
    @objc dynamic var content = ""
    @objc dynamic var createDate = ""
    @objc dynamic var isFavorite = false
}
