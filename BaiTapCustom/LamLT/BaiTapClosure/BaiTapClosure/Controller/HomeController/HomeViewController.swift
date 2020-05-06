import UIKit

class HomeViewController: BaseViewController {

    var viewModel = HomeViewModel()

    // MARK: - IBOutlet
    @IBOutlet weak var onlineButton: UIButton!
    @IBOutlet weak var offButton: UIButton!

    // MARK: - Properties
    var online: String = ""
    var off: String = ""
    var name: String = ""

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
        customNavi()
    }

    func customNavi() {
        title = "Home"
//        navigationController?.navigationBar.backgroundColor = UIColor(displayP3Red: 221, green: 160, blue: 72, alpha: 1)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "sceen"), for: .default)
    }

    // MARK : - Action
    @IBAction func onlineStatusButtonTouchUpInside(_ sender: Any) {
        let dvc = DetailsViewController()
        dvc.action = { [weak self] action in
            guard let this = self else { return }
            switch action {
            case .updateImage:
                this.online = self!.viewModel.image
                this.name = self!.viewModel.name
                dvc.profileImage.image = UIImage(named: this.online)
                dvc.nameProfileLabel.text = this.name
                dvc.profileImage.layer.borderColor = UIColor.gray.cgColor
            }
        }
        self.navigationController?.pushViewController(dvc, animated: true)
    }

    @IBAction func offlineStatusButtonTouchUpInside(_ sender: Any) {
        let dvc = DetailsViewController()
        dvc.action = { [weak self] action in
            guard let this = self else { return }
            switch action {
            case .updateImage:
                this.online = self!.viewModel.image
                this.name = self!.viewModel.name
                dvc.profileImage.image = UIImage(named: this.online)
                dvc.nameProfileLabel.text = this.name
            }
        }
        self.navigationController?.pushViewController(dvc, animated: true)
    }

}
