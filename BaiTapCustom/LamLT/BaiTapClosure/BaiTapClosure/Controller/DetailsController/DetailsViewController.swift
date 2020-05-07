import UIKit

class DetailsViewController: BaseViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var nameProfileLabel: UILabel!
    @IBOutlet weak var avatarView: AvatarView!
    @IBOutlet weak var profileImage: UIImageView!

    // MARK: - Enum
    enum Action {
        case updateImage
    }

    // MARK: - Properties
    var action: ((Action) -> Void)?
    var type: AvatarView.TypeView = .on
    
    // MARK: - Life Cycle
    init(type: AvatarView.TypeView = .on) {
        super.init(nibName: nil, bundle: nil)
        self.type = type
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        profileImage.layer.borderWidth = 1.0
        profileImage.layer.masksToBounds = false
        profileImage.layer.cornerRadius = profileImage.frame.size.height / 2
        profileImage.clipsToBounds = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "sceen"), for: .default)
    }

}
