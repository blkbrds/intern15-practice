import UIKit

class HomeViewController: BaseViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var onlineButton: UIButton!
    @IBOutlet weak var offButton: UIButton!

    // MARK: - Properties
    var online: String = ""
    var off: String = ""
    var name: String = ""
    var viewModel = HomeViewModel()

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Public Function
    override func setUpUI() {
        onlineButton.layer.masksToBounds = false
        onlineButton.layer.cornerRadius = 15
        onlineButton.clipsToBounds = true
        offButton.layer.masksToBounds = false
        offButton.layer.cornerRadius = 15
        offButton.clipsToBounds = true
    }

    // MARK : - Action
    @IBAction func onlineStatusButtonTouchUpInside(_ sender: Any) {
        let detail = Bundle.main.loadNibNamed("HomeView", owner: self, options: nil)?.first as? HomeView
        if let detail = detail {
            detail.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            view.addSubview(detail)
            detail.profileImage.layer.borderWidth = 1.0
            detail.profileImage.layer.masksToBounds = false
            detail.profileImage.layer.cornerRadius = detail.profileImage.frame.size.height / 2
            detail.profileImage.clipsToBounds = true
        }
        detail?.action = { [weak self] action in
            guard let this = self else { return }
            switch action {
            case .updateImage:
                this.online = self!.viewModel.image
                this.name = self!.viewModel.name
                detail?.profileImage.layer.borderWidth = 5.0
                detail?.profileImage.image = UIImage(named: this.online)
                detail?.nameProfile.text = this.name
                detail?.profileImage.layer.borderColor = UIColor.gray.cgColor
            }
        }
        detail?.updatePicture()
    }

    @IBAction func offlineStatusButtonTouchUpInside(_ sender: Any) {
//        let detail = Bundle.main.loadNibNamed("HomeView", owner: self, options: nil)?.first as? HomeView
//        if let detail = detail {
//            detail.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
//            view.addSubview(detail)
//            detail.profileImage.layer.borderWidth = 1.0
//            detail.profileImage.layer.masksToBounds = false
//            detail.profileImage.layer.cornerRadius = detail.profileImage.frame.size.height / 2
//            detail.profileImage.clipsToBounds = true
//        }
//        detail?.action = { [weak self] action in
//            guard let this = self else { return }
//            switch action {
//            case .updateImage:
//                this.online = self!.viewModel.image
//                this.name = self!.viewModel.name
//                detail?.profileImage.image = UIImage(named: this.online)
//                detail?.nameProfile.text = this.name
//            }
//        }
//        detail?.updatePicture()
        let vc = DetailsViewController(type: .on)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func hideView() {
        
    }
}
