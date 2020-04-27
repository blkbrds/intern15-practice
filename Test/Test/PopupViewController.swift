import UIKit

final class PopupViewController: UIViewController {

    var popupView: PopupView!
    var alretView: PopupView!

    var img: String = "bo"
    var titleFood: String = "Thit Bo"
    var resourceInfo: [String] = ["- 500g Sườn", "15ml rượu", "20ml Tương", "45ml Giấm", "45g Đường"]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        view.backgroundColor = UIColor(patternImage: UIImage(named: "cl1")!)
        if let popupView = Bundle.main.loadNibNamed("View", owner: self, options: nil)?.first as? PopupView {

            popupView.frame = CGRect(x: 40, y: 200, width: 300, height: 400)
            view.addSubview(popupView)

            popupView.dataSource = self
            popupView.delegate = self

            self.popupView = popupView

            popupView.isHidden = true
        }

        if let updateView = Bundle.main.loadNibNamed("View2", owner: self, options: nil)?.first as? PopupView {
            updateView.frame = CGRect(x: 85, y: 350, width: 200, height: 10)
            view.addSubview(updateView)

            updateView.delegate = self

            self.alretView = updateView

            updateView.isHidden = true
        }
    }

    private func config(show: Bool) {
        popupView.isHidden = show
        popupView.setUpData()
    }

    private func config2(show: Bool) {
        alretView.isHidden = show
    }

    @IBAction private func showPopupTouchUpInside(_ sender: UIButton) {
        config(show: false)
        view.backgroundColor = UIColor(patternImage: UIImage(named: "cl2")!)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        config(show: true)
        view.backgroundColor = UIColor(patternImage: UIImage(named: "cl1")!)
    }
}

extension PopupViewController: PopupViewDataSource {

    func getTitle(title popupView: PopupView) -> String {
        return titleFood
    }

    func getImage(img popupView: PopupView) -> String {
        return img
    }
}

extension PopupViewController: PopupViewDelegate {
    func updateView() {
        config(show: true)
        config2(show: false)
    }

    func hideView() {
        config(show: true)
        view.backgroundColor = UIColor(patternImage: UIImage(named: "cl1")!)
    }
}
