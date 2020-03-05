

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tapButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
//        tapButton.addTarget(self, action: #selector(buttonrandom), for: .touchUpInside)
        
        
    }
    
    @objc func buttonrandom() {
        view.backgroundColor = UIColor(displayP3Red: CGFloat.random(in: 0...255) / 255, green: CGFloat.random(in: 0...255) / 255, blue: CGFloat.random(in: 0...255) / 255, alpha: 1)
    }
    
    @IBAction func random(_ sender: Any) {
         view.backgroundColor = UIColor(displayP3Red: CGFloat.random(in: 0...255) / 255, green: CGFloat.random(in: 0...255) / 255, blue: CGFloat.random(in: 0...255) / 255, alpha: 1)
    }
    
    
}
