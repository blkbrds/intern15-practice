import UIKit

final class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "View Controller A"
        navigationController?.navigationBar.backgroundColor = .cyan
    }
    
    @IBAction private func handleNextButtonTouchUpInside(_ sender: Any) {
        let bViewController = BViewController()
        navigationController?.pushViewController(bViewController, animated: true)
    }
}