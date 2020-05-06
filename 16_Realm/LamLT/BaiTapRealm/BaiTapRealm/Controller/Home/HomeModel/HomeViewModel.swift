import Foundation
import RealmSwift

protocol HomeViewModelDelegate: class {
    func viewModel(_ viewModel: HomeViewModel, needperfomAction action: HomeViewModel.Action)
}

final class HomeViewModel {
    // MARK: - Properties
    private var musics: [Music] = []

    enum Action {
        case reloadData
    }

    private var notificationToken: NotificationToken?
    weak var delegate: HomeViewModelDelegate?

    func setupObserve() {
        do {
            let realm = try Realm()
            notificationToken = realm.objects(Music.self).observe({ (change) in
                self.delegate?.viewModel(self, needperfomAction: .reloadData)
            })
        } catch {
            print("")
        }
    }

    func fetchData(completion: (Bool) -> ()) {
        do {
            let realm = try Realm()
            let results = realm.objects(Music.self)

            musics = Array(results)
            print(musics)
            completion(true)
        } catch {
            completion(false)
        }
    }

    func deleteAll(completion: (Bool) -> ()) {
        do {
            let realm = try Realm()
            let results = realm.objects(Music.self)
            try realm.write {
                realm.delete(results)
            }
            completion(true)
        } catch {
            completion(false)
        }
    }

    // TableView
    func numberMusic() -> Int {
        musics.count
    }

    func getMusic(at indexPath: IndexPath) -> Music {
        return musics[indexPath.row]
    }
}
