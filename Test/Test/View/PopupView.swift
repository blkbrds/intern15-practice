import UIKit

protocol PopupViewDelegate: class {
    func hideView()
    func updateView()
}

protocol PopupViewDataSource: class {
    func getImage(img popupView: PopupView) -> String
    func getTitle(title popupView: PopupView) -> String
}

final class PopupView: UIView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var foodImage: UIImageView!

    weak var dataSource: PopupViewDataSource?

    weak var delegate: PopupViewDelegate?

    func setUpData() {
        if let dataSource = dataSource {
            foodImage.image = UIImage(named: "\(dataSource.getImage(img: self))")
            titleLabel.text = dataSource.getTitle(title: self)
        }
    }

    @IBAction func hideButtonTouchUpInside(_ sender: Any) {
        if let delegate = delegate {
            delegate.hideView()
        }
    }


    @IBAction func updateButtonTouchUpInside(_ sender: Any) {
        if let delegate = delegate {
            delegate.updateView()
        }
    }
}
