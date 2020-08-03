import UIKit
import RealmSwift

class HomeViewController: BaseViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!

    // MARK: - Properties
    var check: Bool = true

    // MARK: - viewModel
    var viewmodel = PostViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewmodel.delegate = self
        viewmodel.setupObserve()
    }

    override func setUpData() {
        fetchData()
    }

    private func addPost(title: String, content: String, date: String, isFavorite: Bool) {
        let realm = try! Realm()

        let post = Post()
        post.title = title
        post.content = content
        post.createDate = date
        post.isFavorite = isFavorite

        try! realm.write {
            realm.add(post)
        }
    }

    override func setUpUI() {
        title = "Category"
        customNavi()
        let nib = UINib(nibName: "CategoryTableViewCell", bundle: .main)
        tableView.delegate = self
        tableView.register(nib, forCellReuseIdentifier: "cell")
    }

    override func customNavi() {
        let backIcon = UIImage(named: "back-to-left")
        let backButton = UIBarButtonItem(image: backIcon, style: .plain, target: self, action: #selector(backToCategoryTouchUpInside))
        navigationItem.leftBarButtonItem = backButton

        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editCategoryButtonTouchUpInside))
        navigationItem.rightBarButtonItem = editButton
    }

    private func updateUI() {
        tableView.reloadData()
    }

    private func fetchData() {
        viewmodel.fetchData { (done) in
            if done {
                self.updateUI()
            } else {
                print("Failed Fetch Data")
            }
        }
    }

    private func deleteData() {
        viewmodel.deleteAll { (done) in
            if done {
                self.fetchData()
            } else {
                print("Failed Delete ALL DATA")
            }
        }
    }


    @IBAction func addPostButtonTouchUpInside(_ sender: UIButton) {
        let apv = AddPostViewController()
        apv.isAdd = true
        self.navigationController?.pushViewController(apv, animated: true)
    }

    @objc func backToCategoryTouchUpInside() {

    }

    @objc func editCategoryButtonTouchUpInside() {

    }
}

// MARK: -
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewmodel.numberPost()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CategoryTableViewCell
        let post = viewmodel.getPosts(at: indexPath)
        cell.titlePostLabel.text = post.title
        cell.dateTimeLabel.text = post.createDate
        cell.contentLabel.text = post.content
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let post = viewmodel.getPosts(at: indexPath)
        let dpv = DetailPostViewController()
        print(post.title)
        dpv.titlePost = post.title
        dpv.detailContentPost = post.content
        dpv.detailDatePost = post.createDate
        dpv.post = viewmodel.getPosts(at: indexPath)
        self.navigationController?.pushViewController(dpv, animated: true)
    }
}

extension HomeViewController: HomeViewModelDelegate {
    func viewModel(_ viewModel: PostViewModel, needperfomAction action: PostViewModel.Action) {
        fetchData()
    }
}

extension HomeViewController: CategoryTableViewCellDelegate {
    func checkFavorite(isFavorite: Bool) {
        check = !check
    }
}
