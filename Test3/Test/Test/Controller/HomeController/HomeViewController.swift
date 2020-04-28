import UIKit

final class HomeViewController: UIViewController {

    //MARK: - Outlet
    @IBOutlet private weak var resultLabel: UILabel!
    @IBOutlet private weak var showPopupButton: UIButton!
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        resultLabel.isHidden = true
    }

    //MARK: - Action
    @IBAction func showPopupTouchUpInside(_ sender: Any) {
        let popUpViewController = PopupViewController()
        popUpViewController.dataSource = self
        popUpViewController.delegate = self
        self.present(popUpViewController, animated: true, completion: nil)
    }
}

extension HomeViewController: PopupViewDataSource {
    func getImage(imageNameFood popupView: PopupViewController) -> String {
        return Config.foodImage
    }

    func getTitle(title popupView: PopupViewController) -> String {
        return Config.foodTitle
    }
}

extension HomeViewController: PopupViewDelegate {
    func updateView() {
        showPopupButton.isHidden = true
        resultLabel.isHidden = false
    }
}

//MARK: - Config
extension HomeViewController {
    struct Config {
        static var foodTitle: String = "Cafe"
        static var foodImage: String = "food"
    }
}
