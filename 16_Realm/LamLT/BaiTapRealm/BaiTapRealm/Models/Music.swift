import Foundation
import RealmSwift

final class Music: Object {
    @objc dynamic var title = ""
    @objc dynamic var count = 0
    @objc dynamic var type = ""
    @objc dynamic var date = ""
}
