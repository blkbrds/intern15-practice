
import UIKit

final class HomeViewController: BaseViewController {

    // MARK: - Properties
    @IBOutlet weak var tableView: UITableView!
    var exercises: [Exercise] = []
    
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - config
    override func setupUI() {
        super.setupUI()
        self.title = "Protocol"
        tableView.register(UINib(nibName: "HomeCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    override func setupData() {
        exercises = DataManagement.share.getExercises(fileName: "exercises", type: "plist")
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.exercises.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? HomeCell
        let ex = exercises[indexPath.row]
        cell?.titleLabel.text = ex.name
        cell?.subTitleLabel.text = ex.description
        return cell!
    }
    
    // MARK: - Table view delegate
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
        default:
            // create the alert
            let alert = UIAlertController(title: "Warning",
                                          message: "Please, create new View Controller.",
                                          preferredStyle: UIAlertController.Style.alert)
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            // show the alert
            self.present(alert, animated: true, completion: nil)
        }
    }
}
