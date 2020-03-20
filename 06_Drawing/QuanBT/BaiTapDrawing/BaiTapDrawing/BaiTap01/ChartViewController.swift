import UIKit

final class ChartViewController: UIViewController {
    // MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        let chart = MyChart(frame: CGRect(x: 10, y: 200, width: 400, height: 300))
        chart.values = [30, 11, 20, 55, 77, 60, 98]
        view.addSubview(chart)
    }
}
