
import UIKit

final class Ex6ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        super.title = "Ex5"
    }
    @IBAction func gotoEx6_1(_ sender: Any) {
        let vc = Ex6_1ViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        self.title = "EX5_1"
    }

    @IBAction func gotoEx6_2(_ sender: Any) {
        let vc = Ex6_2ViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        self.title = "EX5_2"
    }
    @IBAction func gotoEx6_3(_ sender: Any) {
        let vc = Ex6_3ViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        self.title = "EX5_3"
    }
    @IBAction func gotoEx6_4(_ sender: Any) {
        let vc = Ex6_4ViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        self.title = "EX5_4"
    }
    @IBAction func gotoEx6_5(_ sender: Any) {
        let vc = Ex6_5ViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        self.title = "EX5_5"
    }
}
