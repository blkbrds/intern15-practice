import UIKit

class PieChartViewController: UIViewController {
    // MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        let pieChart = MyPieChart(frame: CGRect(x: 50, y: 200, width: 300, height: 300))
        pieChart.values = [100.0, 200.0, 150.0, 50.0]
        view.addSubview(pieChart)
    }
}
