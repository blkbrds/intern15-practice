import UIKit

class BaseViewController: UIViewController {

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupData()
    }

    // MARK: - Public Functions
    func setupUI() { }

    func setupData() { }
}
