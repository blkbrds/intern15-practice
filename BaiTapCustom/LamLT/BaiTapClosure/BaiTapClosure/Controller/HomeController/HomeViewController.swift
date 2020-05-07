import UIKit

class HomeViewController: BaseViewController {

    var viewModel = Data()

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
//        dvc.action = { [weak self] action in
//            guard let this = self else { return }
//            switch action {
//            case .updateImage:
//                this.online = "dog"
//                this.name = "Con Mèo"
//                dvc.profileImage.image = UIImage(named: this.online)
//                dvc.nameProfileLabel.text = this.name
//            }
//        }
        let vc = Avatar()
        vc.action = { [weak self] action in
            guard let this = self else { return }
            switch action {
            case .on:
                this.online = "dog"
                vc.userAvatar.image = UIImage(named: this.online)
                vc.layer.cornerRadius = vc.layer.frame.size.height / 2
            }
        }
        self.navigationController?.pushViewController(dvc, animated: true)
    }
//        @IBAction func offlineStatusButtonTouchUpInside(_ sender: Any) {
//        let dvc = DetailsViewController()
//        dvc.action = { [weak self] action in
//            guard let this = self else { return }
//            switch action {
//            case .updateImage:
//                this.online = "dog"
//                this.name = "Con Chó"
//                dvc.profileImage.image = UIImage(named: this.online)
//                dvc.nameProfileLabel.text = this.name
//            }
//        }
//
//            let vc = DetailsViewController(type: .off)
//
//            self.navigationController?.pushViewController(vc, animated: true)
//
//        }
}

