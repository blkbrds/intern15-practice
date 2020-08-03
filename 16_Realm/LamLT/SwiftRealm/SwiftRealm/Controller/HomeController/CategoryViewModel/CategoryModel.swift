import Foundation
import RealmSwift

protocol HomeViewModelDelegate: class {
    func viewModel(_ viewModel: HomeViewModel, needperfomAction action: HomeViewModel.Action)
}

final class HomeViewModel {

    // MARK: - Properties
    var categorys: [Category] = []

    enum Action {
        case reloadData
    }

    private var notificationToken: NotificationToken?
    weak var delegate: HomeViewModelDelegate?

    func setupObserve() {
        do {
            let realm = try Realm()
            notificationToken = realm.objects(Category.self).observe({ (change) in
                self.delegate?.viewModel(self, needperfomAction: .reloadData)
            })
        } catch {
            print("")
        }
    }

    // MARK: - Puclic Functions
    func fetchData(completion: (Bool) -> ()) {
        do {
            let realm = try Realm()
            let results = realm.objects(Category.self)
            categorys = Array(results)
            print(categorys)
            completion(true)
        } catch {
            completion(false)
        }
    }

    func deleteAll(completion: (Bool) -> ()) {
        do {
            let realm = try Realm()
            let results = realm.objects(Category.self)
            try realm.write {
                realm.delete(results)
            }
            completion(true)
        } catch {
            completion(false)
        }
    }

    func numberCategory() -> Int {
        categorys.count
    }

    func viewModelForCell(at indexPath: IndexPath) -> CategoryCellViewModel {
        let data = categorys[indexPath.row]
        let viewmodel = CategoryCellViewModel(category: data)
        return viewmodel
    }
}

