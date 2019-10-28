
import UIKit

class HomeViewController: BaseViewController {
    @IBOutlet weak var tableView: UITableView!
    var exercises: [Exercise] = []
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func setupUI() {
        super.setupUI()
        self.title = "Part XXX"
        tableView.register(UINib(nibName: "HomeCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    override func setupData() {
        exercises = DataManagement.share.getExercises(fileName: "exercises", type: "plist")
    }
}
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.exercises.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? HomeCell

        let ex = exercises[indexPath.row]
        cell?.titleLabel.text = ex.name
        cell?.subTitleLabel.text = ex.description
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            let vc = Ex1ViewController()
            vc.exercise = self.exercises[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = Ex2ViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = Ex3ViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 3:
            let vc = Ex4ViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 4:
            let vc = Ex5ViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 5:
            let vc = Ex6ViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 6:
            let vc = Ex7ViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 7:
            let vc = Ex8ViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 8:
            let vc = Ex9ViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 9:
            let vc = Ex10ViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 10:
            let vc = Ex11ViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 11:
            let vc = Ex12ViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 12:
            let vc = Ex13ViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 13:
            let vc = Ex14ViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 14:
            let vc = Ex15ViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            let alert = UIAlertController(title: "Warning",
                message: "Please, create new View Controller.",
                preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}








