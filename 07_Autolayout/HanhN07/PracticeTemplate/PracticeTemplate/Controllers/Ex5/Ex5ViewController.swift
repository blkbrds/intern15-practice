
import UIKit

final class Ex5ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Ex4"
    }

    @IBAction func gotoEx5_4(_ sender: Any) {
        let vc = Ex5_4ViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        self.title = "EX4_4"
    }

    @IBAction func gotoEx5_2(_ sender: Any) {
        let vc = Ex5_2ViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        self.title = "EX4_2"
    }
    @IBAction func gotoEx5_3(_ sender: Any) {
        let vc = Ex5_3ViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        self.title = "EX4_3"
    }
    @IBAction func gotoEx5_5(_ sender: Any) {
        let vc = Ex5_5ViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        self.title = "EX4_5"
    }
}

