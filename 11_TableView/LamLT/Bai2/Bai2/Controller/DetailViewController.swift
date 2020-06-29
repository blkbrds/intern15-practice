import UIKit

class DetailViewController: UIViewController {
    var name: String = ""
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "DETAIL"
        nameLabel.text = name
    }
}
