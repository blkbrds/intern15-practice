import UIKit
import RealmSwift

class AddPostViewController: BaseViewController {

    // MARK: - Properties
    var isAdd = false
    var post: Post?
    let curentDate = NSDate()
    let dateFormatter = DateFormatter()
    let currentDateTime = Date()
    let formatter = DateFormatter()
    var detailContentPost: String = ""
    var detailDatePost: String = ""
    var titlePost: String = ""

    // MARK: - IBOutlet
    @IBOutlet weak var titlePostTextField: UITextField!
    @IBOutlet weak var contentPostTextView: UITextView!

    // MARK: - Override Funcs
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func setUpUI() {
        title = isAdd ? "Add Post" : "Edit Post"
        titlePostTextField.text = titlePost
        contentPostTextView.text = detailContentPost
        contentPostTextView.layer.borderWidth = 1.0
        contentPostTextView.layer.borderColor = UIColor.blue.cgColor
        contentPostTextView.layer.masksToBounds = false
        contentPostTextView.layer.cornerRadius = 15
        contentPostTextView.clipsToBounds = true
    }

    override func customNavi() {
        let backIcon = UIImage(named: "back-to-left")
        let backButton = UIBarButtonItem(image: backIcon, style: .plain, target: self, action: #selector(backToCategoryTouchUpInside))
        navigationItem.leftBarButtonItem = backButton

        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donePostButtonTouchUpInside))
        navigationItem.rightBarButtonItem = doneButton
    }

    @objc func backToCategoryTouchUpInside() {
        self.navigationController?.popViewController(animated: true)
    }

    @objc func donePostButtonTouchUpInside() {
        formatter.timeStyle = .medium
        formatter.dateStyle = .long
        let dateTimeString = formatter.string(from: currentDateTime)
        guard let title = titlePostTextField.text,
            let content = contentPostTextView.text else { return }
        if isAdd {
            //add new a item
            do {
                let realm = try Realm()
                let post = Post()
                post.title = title
                post.content = content
                post.createDate = dateTimeString
                post.isFavorite = false
                try realm.write {
                    realm.add(post)
                }
                self.navigationController?.popViewController(animated: true)
            } catch {
                print("Lỗi thêm đối tượng vào Realm")
            }
        } else {
            // Edit Post
            do {
                if let post = post {
                    let realm = try Realm()
                    try realm.write {
                        post.title = title
                        post.content = content
                        post.createDate = dateTimeString
                    }
                    self.navigationController?.popToRootViewController(animated: true)
                }
            } catch {
                print("Lỗi edit đối tượng")
            }
        }
    }
}
