import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let firstView = ColumnChartDraw()
        let secondView = CircleDraw()
        firstView.backgroundColor = .white
        secondView.backgroundColor = .white
        self.view = secondView
    }
}
