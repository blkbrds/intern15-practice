import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var onlineButton: UIButton!
    @IBOutlet weak var offButton: UIButton!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        customNavi()
    }
    
    func customNavi() {
        title = "Home"
        navi.navigationBar.backgroundColor = UIColor(displayP3Red: 221, green: 160, blue: 72, alpha: 1)
    }
    
}
