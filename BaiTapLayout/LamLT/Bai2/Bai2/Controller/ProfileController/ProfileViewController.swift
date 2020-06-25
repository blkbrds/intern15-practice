import UIKit

class ProfileViewController: UIViewController {

    //MARK : - IBOutlet
    @IBOutlet weak var detailsAvatarImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var sexLabel: UILabel!
    @IBOutlet weak var birthDayLabel: UILabel!
    @IBOutlet weak var infoPersonLabel: UILabel!
    @IBOutlet weak var addressPersonLabel: UILabel!
    
    // MARK : - Properties
    var name: String = ""
    var sex: String = ""
    var birthDay: String = ""
    var info: String = ""
    var address: String = ""
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }

    // MARK: - Public Func
    func configUI() {
        title = "Thông Tin Cá Nhân"
        detailsAvatarImage.layer.borderWidth = 1.0
        detailsAvatarImage.layer.masksToBounds = false
        detailsAvatarImage.layer.cornerRadius = detailsAvatarImage.frame.size.height / 2
        detailsAvatarImage.clipsToBounds = true
        nameLabel.text = name
        sexLabel.text = sex
        birthDayLabel.text = birthDay
        infoPersonLabel.text = info
        addressPersonLabel.text = address
    }
}
