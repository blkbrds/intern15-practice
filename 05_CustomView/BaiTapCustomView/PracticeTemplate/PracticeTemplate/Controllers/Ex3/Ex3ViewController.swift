
import UIKit

class Ex3ViewController: BaseViewController {
    let button = BadgeNumberButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        button.frame = CGRect(x: 140, y: 100, width: 150, height: 70)
        button.backgroundColor = .systemBlue
        button.text = "99+"
        button.numberBagdePosition = .topCenter
        button.layer.cornerRadius = 10
        button.setTitle("Photos", for: .normal)
        view.addSubview(button)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: config
    override func setupUI() {
        super.setupUI()
        self.title = "Ex3"
    }

    override func setupData() {
    }
}
