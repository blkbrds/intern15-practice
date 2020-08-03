import UIKit
import RealmSwift

class DetailPostViewController: BaseViewController {

    @IBOutlet weak var datePostLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!

    // MARK: - Properties
    var detailContentPost: String = ""
    var detailDatePost: String = ""
    var titlePost: String = ""
    var post: Post?
    
    // MARK: - viewModel
    var viewmodel = PostViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        print(post)
    }

    override func setUpData() {
        title = titlePost
        datePostLabel.text = detailDatePost
        contentLabel.text = detailContentPost
    }
    
    override func customNavi() {
        
    }

    // MARK: - Action
    @IBAction func editPostButtonTouchUpInside(_ sender: Any) {
        let av = AddPostViewController()
        av.isAdd = false
        av.titlePost = titlePost
        av.detailContentPost = detailContentPost
        av.post = post
        self.navigationController?.pushViewController(av, animated: true)
    }

    @IBAction func deletePostButtonTouchUpInside(_ sender: Any) {
        let alert = UIAlertController(title: "Delete Item", message: "Are You Sure?", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Not Yet", style: UIAlertAction.Style.default, handler: { _ in
        }))
        alert.addAction(UIAlertAction(title: "Yeah", style: UIAlertAction.Style.default, handler: { (_: UIAlertAction!) in
            do {
                if let post = self.post {
                    let realm = try Realm()
                    try realm.write {
                        realm.delete(post)
                    }
                    self.navigationController?.popToRootViewController(animated: true)
                }
            } catch {
                print("Failed Delete Item")
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
