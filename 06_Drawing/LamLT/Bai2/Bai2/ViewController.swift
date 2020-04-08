import UIKit

class ViewController: UIViewController {

    var pieChart: PieChartView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        let frame = self.view.frame
        pieChart = PieChartView(frame: frame)
        view.addSubview(pieChart)
    }
}
