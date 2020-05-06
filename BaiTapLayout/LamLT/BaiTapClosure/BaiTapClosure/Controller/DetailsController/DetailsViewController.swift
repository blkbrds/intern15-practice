import UIKit

class DetailsViewController: BaseViewController {

    @IBOutlet weak var nameProfileLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    enum Action {
        case updateImage
    }

    var action: ((Action) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        updatePicture()
    }

    private func updatePicture() {
        self.action?(.updateImage)
    }

    override func setUpUI() {
        title = "Detail"
//        let color1 = UIColor(displayP3Red: 49.0, green: 133.0, blue: 203.0, alpha: 1)
        profileImage.layer.borderWidth = 1.0
        profileImage.layer.masksToBounds = false
        profileImage.layer.cornerRadius = profileImage.frame.size.height / 2
        profileImage.clipsToBounds = true
        profileImage.layer.borderColor = UIColor.gray.cgColor
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "sceen"), for: .default)
    }

}
