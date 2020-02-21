import UIKit

class NewsFeedViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "News Feed"
        let buttonIcon = UIImage(named: "Phone Book")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: buttonIcon, style: .plain, target: self, action: #selector(touchUpInsideEditButton))
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "Search"), style: .plain, target: self, action: #selector(touchUpInsideSearchButton))
    }
    
    @objc func touchUpInsideEditButton() { }
    
    @objc func touchUpInsideSearchButton() { }
}
