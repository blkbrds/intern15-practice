
import UIKit

protocol Ex3ViewControllerDataSource: class {
    func getLocation() -> Location
}

final class Ex3ViewController: BaseViewController {

    @IBOutlet private weak var stateLabel: UILabel!
    @IBOutlet private weak var cityLabel: UILabel!
    @IBOutlet private weak var districtLabel: UILabel!

    weak var dataSource: Ex3ViewControllerDataSource? {
        didSet {
            updateUI()
        }
    }

    private var state: String = ""
    private var city: String = ""
    private var district: String = ""
    private var location = Location()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Địa Điểm"
        let editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(gotoStateVC))
        navigationItem.rightBarButtonItems = [editButton]
    }

    override func updateUI() {
        guard let state = dataSource?.getLocation().state,
            let city = dataSource?.getLocation().city,
            let district = dataSource?.getLocation().district else { return }
        stateLabel.text = state
        cityLabel.text = city
        districtLabel.text = district
    }

    // function thay đổi miền
    @objc func gotoStateVC() {
        let vc = MienViewController()
        vc.dataSource = self
        navigationController?.pushViewController(vc, animated: true)
    }

    override func setupData() {
        stateLabel.text = location.state
        cityLabel.text = location.city
        districtLabel.text = location.district
    }
}

extension Ex3ViewController: MienViewControllerDataSource {
    func getLocation() -> Location {
        return Location(state: state, city: city, district: district)
    }
}

