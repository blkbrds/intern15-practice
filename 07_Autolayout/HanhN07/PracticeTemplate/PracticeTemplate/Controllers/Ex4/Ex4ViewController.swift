
import UIKit

final class Ex4ViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: config
    override func setupUI() {
        super.setupUI()
        self.title = "Ex4"
    }
    
    override func setupData() {
    }
    
    @IBAction func gotoEx4_1(_ sender: Any) {
        let vc = Ex4_1ViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
