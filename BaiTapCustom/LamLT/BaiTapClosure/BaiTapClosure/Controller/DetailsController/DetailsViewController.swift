import UIKit

class DetailsViewController: BaseViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var nameProfileLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!

    // MARK: - Enum
    enum Action {
        case updateImage
    }

    // MARK: - Properties
    var action: ((Action) -> Void)?

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updatePicture()
    }

    // MARK: - Private Function
    private func updatePicture() {
        self.action?(.updateImage)
    }

    // MARK: - Override Function
    override func setUpUI() {
        title = "Detail"
//        let color1 = UIColor(displayP3Red: 49.0, green: 133.0, blue: 203.0, alpha: 1)
        profileImage.layer.borderWidth = 1.0
        profileImage.layer.masksToBounds = false
        profileImage.layer.cornerRadius = profileImage.frame.size.height / 2
        profileImage.clipsToBounds = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "sceen"), for: .default)
    }

}
