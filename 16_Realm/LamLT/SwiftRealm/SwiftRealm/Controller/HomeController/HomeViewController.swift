import UIKit
import RealmSwift

class HomeViewController: BaseViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!

    // MARK: - Properties
    var viewmodel = HomeViewModel()

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewmodel.delegate = self
        viewmodel.setupObserve()
    }

    override func setUpUI() {
        title = "Categories"
        customNavi()
        let nib = UINib(nibName: "CategoryTableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "cell")
    }

    override func setUpData() {
        fetchData()
    }

    override func customNavi() {
        let addIcon = UIImage(named: "add")
        let addButton = UIBarButtonItem(image: addIcon, style: .plain, target: self, action: #selector(newButtonTouchUpInside))
        navigationItem.leftBarButtonItem = addButton

        let deleteButton = UIBarButtonItem(title: "Delete", style: .plain, target: self, action: #selector(deleteButtonTouchUpInside))
        navigationItem.rightBarButtonItem = deleteButton
    }

    // MARK: - Private Funcs
    private func updateUI() {
        tableView.reloadData()
    }

    private func addCategory(title: String, date: String, type: String, count: Int) {
        let realm = try! Realm()

        let category = Category()
        category.title = title
        category.date = date
        category.type = type
        category.count = count

        try! realm.write {
            realm.add(category)
        }
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

    @objc private func newButtonTouchUpInside() {
        let aev = AddEditCategoryViewController()
        aev.isAdd = true
        self.navigationController?.pushViewController(aev, animated: true)
    }

    @objc private func deleteButtonTouchUpInside() {
        viewmodel.deleteAll { (done) in
            if done {
                self.fetchData()
            } else {
                print("Failed Delete ALL DATA")
            }
        }
    }
}

// MARK: UITableViewDelegate, UITableViewDataSource
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewmodel.numberCategory()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CategoryTableViewCell
        cell.viewmodel = viewmodel.viewModelForCell(at: indexPath)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = viewmodel.categorys[indexPath.row]
        let vc = DetailCategoryViewController()
        print(item)
        vc.viewModel = AddEditCategoryViewModel(category: item)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeViewController: HomeViewModelDelegate {
    func viewModel(_ viewModel: HomeViewModel, needperfomAction action: HomeViewModel.Action) {
        fetchData()
    }
}
