import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var userNameLabel: UILabel!

    var viewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        userNameLabel.text = viewModel.userName
        fetchData()
    }

    func fetchData() {
        viewModel.fetchData { (done, userName, password) in
            if done {
                userNameLabel.text = viewModel.userName
            } else {
                print("Failed")
            }
        }
    } }
