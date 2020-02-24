

import UIKit

class MyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
    }



 

    @IBAction func changeColorButtonTouchUpInside(_ sender: Any) {
//        let random = CGFloat.random(in: 0...255) / 255
//        view.backgroundColor = UIColor(displayP3Red: random, green: random, blue: random, alpha: random )
        self.view.backgroundColor = UIColor(displayP3Red: CGFloat.random(in: 0...255) / 255, green: CGFloat.random(in: 0...255) / 255, blue: CGFloat.random(in: 0...255) / 255, alpha: 1)

    }
}
