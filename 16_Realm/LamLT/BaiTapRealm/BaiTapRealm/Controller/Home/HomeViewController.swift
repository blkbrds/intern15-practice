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
        let nib = UINib(nibName: "HomeTableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "cell")
    }

    override func setUpData() {
        fetchData()
    }

    // MARK: - Private Funcs
    private func addMusic(title: String, count: Int, date: String, type: String) {
        let realm = try! Realm()

        let music = Music()
        music.title = title
        music.count = count
        music.date = date
        music.type = type

        try! realm.write {
            realm.add(music)
        }
    }

    private func customNavi() {
        let addIcon = UIImage(named: "add")
        let addButton = UIBarButtonItem(image: addIcon, style: .plain, target: self, action: #selector(newButtonTouchUpInside))
        navigationItem.leftBarButtonItem = addButton

        let deleteButton = UIBarButtonItem(title: "Delete", style: .plain, target: self, action: #selector(deleteButtonTouchUpInside))
        navigationItem.rightBarButtonItem = deleteButton
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

    @objc private func newButtonTouchUpInside() {
        let avc = AddCategoryViewController()
        avc.isAdd = true
        self.navigationController?.pushViewController(avc, animated: true)
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
        viewmodel.numberMusic()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeTableViewCell
        let music = viewmodel.getMusic(at: indexPath)
        cell.titleLabel.text = music.title
        cell.countLabel.text = "Count: \(music.count)"
        cell.dateLabel.text = music.date
        cell.typeLabel.text = music.type
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let music = viewmodel.getMusic(at: indexPath)
        let acv = AddCategoryViewController()
        print(music.title)
        acv.isAdd = false
        acv.titleName = music.title
        acv.typeName = music.type
        acv.count = "\(music.count)"
        acv.music = viewmodel.getMusic(at: indexPath)
        self.navigationController?.pushViewController(acv, animated: true)
    }
}

extension HomeViewController: HomeViewModelDelegate {
    func viewModel(_ viewModel: HomeViewModel, needperfomAction action: HomeViewModel.Action) {
        fetchData()
    }
}
