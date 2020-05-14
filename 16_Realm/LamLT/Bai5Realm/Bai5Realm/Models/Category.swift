import Foundation
import RealmSwift

final class Category: Object {
    let posts = List<Post>()
}
