import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var title = ""
    @objc dynamic var count = 0
    @objc dynamic var type = ""
    @objc dynamic var date = ""

    let posts = List<Post>()
}
