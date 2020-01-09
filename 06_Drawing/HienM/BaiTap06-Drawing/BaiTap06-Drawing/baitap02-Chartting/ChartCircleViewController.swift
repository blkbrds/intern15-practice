
import UIKit

class ChartCircleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		let b = DrawCircleView(frame: CGRect(x: 50.0, y: 400.0, width:300,  height: 300))
		view.addSubview(b)
    }
}
