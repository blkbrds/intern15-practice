
import UIKit

final class Ex2ViewController: BaseViewController {

    @IBOutlet private weak var profileSrcollView: UIScrollView!

    private var profile: ProfileData = ProfileData()
    private var profiles: [ProfileData] = []
    private let maxX: CGFloat = UIScreen.main.bounds.width - 50
    private let minX: CGFloat = 0
    private var y: Int = 0
    private var x: Int = 0
    var exercise: Exercise?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profiles"
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setupData()
        updateUserViews()
    }

    override func setupData() {
        profiles = ProfileData.parseData(array: Ex2DataManagement.share.getData())
    }

    //MARK: - Private function
    private func updateUserViews() {
        removeSubview()
        x = 0
        y = 0
        for (index, profile) in profiles.enumerated() {
            configUserView(x: x, y: y, index: index, user: profile)
            x += 130
            if x >= Int(maxX) {
                x = Int(minX)
                y += 150
            }
        }
    }

    private func removeSubview() {
        for subView in profileSrcollView.subviews where subView is ProfileView {
            subView.removeFromSuperview()
        }
    }

    private func configUserView(x: Int, y: Int, index: Int, user: ProfileData) {
        let frame = CGRect(x: 30 + x, y: 10 + y, width: 100, height: 130)
        let profileView = ProfileView()
        profileView.frame = frame
        profileView.delegate = self
        profileView.profileNameLabel.text = user.name
        profileView.profileImageView = UIImageView(image: UIImage(named: user.avatarString))
        profileSrcollView.contentSize.height = CGFloat(y) + 300
        profileSrcollView.addSubview(profileView)
    }
}

extension Ex2ViewController: ProfileViewDelegate {
    func profileView(view: ProfileView, needsPerform action: ProfileView.Action) {
        switch action {
        case .gotoProfileVC(let profileName):
            UserDefaults.standard.set(profileName, forKey: "usernameClicked")
        }
        let vc = ProfileViewController()
        vc.profiles = profiles
        navigationController?.pushViewController(vc, animated: true)
    }
}
