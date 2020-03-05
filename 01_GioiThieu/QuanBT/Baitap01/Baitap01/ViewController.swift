

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bnt: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        bnt.addTarget(self, action: #selector(buttonrandom), for: .touchUpInside)
        
       
    }
@objc func buttonrandom() {
    view.backgroundColor = UIColor(displayP3Red: CGFloat.random(in: 0...255) / 255, green: CGFloat.random(in: 0...255) / 255, blue: CGFloat.random(in: 0...255) / 255, alpha: 1)
    }


}
