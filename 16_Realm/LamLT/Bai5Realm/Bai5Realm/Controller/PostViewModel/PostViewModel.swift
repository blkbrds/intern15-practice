import Foundation
import RealmSwift

protocol HomeViewModelDelegate: class {
    func viewModel(_ viewModel: PostViewModel, needperfomAction action: PostViewModel.Action)
}

final class PostViewModel {

    // MARK: - Properties
    private var posts: [Post] = []

    enum Action {
        case reloadData
    }

    private var notificationToken: NotificationToken?
    weak var delegate: HomeViewModelDelegate?

    func setupObserve() {
        do {
            let realm = try Realm()
            notificationToken = realm.objects(Post.self).observe({ (change) in
                self.delegate?.viewModel(self, needperfomAction: .reloadData)
            })
        } catch {
            print("")
        }
    }

    func fetchData(completion: (Bool) -> ()) {
        do {
            let realm = try Realm()
            let results = realm.objects(Post.self)

            posts = Array(results)
            print(posts)
            completion(true)
        } catch {
            completion(false)
        }
    }

    func deleteAll(completion: (Bool) -> ()) {
        do {
            let realm = try Realm()
            let results = realm.objects(Post.self)
            try realm.write {
                realm.delete(results)
            }
            completion(true)
        } catch {
            completion(false)
        }
    }

    // TableView
    func numberPost() -> Int {
        posts.count
    }

    func getPosts(at indexPath: IndexPath) -> Post {
        return posts[indexPath.row]
    }
}
