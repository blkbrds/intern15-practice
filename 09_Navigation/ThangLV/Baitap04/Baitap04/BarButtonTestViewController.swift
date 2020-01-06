import UIKit

class BarButtonTestViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }

    private func setUpUI() {
        title = "Bar Button Test"
        let questionButton = UIBarButtonItem(image: UIImage(named: "Question Mark"), style: .plain, target: self, action: #selector(touchUpInsideQuestionButton))
        navigationItem.rightBarButtonItem = questionButton
    }
    
    @objc func touchUpInsideQuestionButton() {
        
    }
    
    
}
