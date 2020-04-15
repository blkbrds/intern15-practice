import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var userNameLabel: UILabel!

    var viewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        fetchData()
    }

    func updateUI() {
        userNameLabel.text = viewModel.userName
    }

    func fetchData() {
        viewModel.fetchData { (done, userName, password) in
            if done {
                self.updateUI()
            } else {
                print("Failed")
            }
        }
    } }
