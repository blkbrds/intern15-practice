import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let paint = PaintView()
        paint.draw()
        view.addSubview(paint)
    }
}
