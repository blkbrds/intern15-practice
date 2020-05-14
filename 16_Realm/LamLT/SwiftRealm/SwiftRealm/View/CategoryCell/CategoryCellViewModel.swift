import Foundation

class CategoryCellViewModel {

    var title: String = ""
    var count: Int = 0
    var type: String = ""
    var date: String = ""

    init() {}

    init(category: Category) {
        self.title = category.title
        self.count = category.count
        self.type = category.type
        self.date = category.date
    }
}
