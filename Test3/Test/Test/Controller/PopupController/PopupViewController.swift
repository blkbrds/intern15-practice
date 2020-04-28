import UIKit

//MARK: - Protocol
protocol PopupViewDataSource: class {
    func getImage(imageNameFood popupView: PopupViewController) -> String
    func getTitle(title popupView: PopupViewController) -> String
}

protocol PopupViewDelegate: class {
    func updateView()
}

final class PopupViewController: UIViewController {

    //MARK: - Outlet
    @IBOutlet weak private var contentView: UIView!
    @IBOutlet weak private var titleFoodLabel: UILabel!
    @IBOutlet weak private var imageFood: UIImageView!
    @IBOutlet weak private var sourceFoodTextView: UITextView!

    //MARK: - Properties
    weak var dataSource: PopupViewDataSource?
    weak var delegate: PopupViewDelegate?


    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpData()
    }

    //MARK: - Private Function
    private func setUpData() {
        if let dataSource = dataSource {
            titleFoodLabel.text = dataSource.getTitle(title: self)
            imageFood.image = UIImage(named: "\(dataSource.getImage(imageNameFood: self))")
        }
    }

    //MARK: - Action
    @IBAction func hideButtonTouchUpInside(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }

    @IBAction func updateTextButtonTouchUpInside(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
        if let delegate = delegate {
            delegate.updateView()
        }
    }

    //MARK: - Override Function
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first, touch.view == view {
            navigationController?.popViewController(animated: true)
            dismiss(animated: true, completion: nil)
        }
    }
}
