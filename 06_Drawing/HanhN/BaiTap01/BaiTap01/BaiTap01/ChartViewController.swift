
import UIKit

class ChartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let frame = CGRect(x: 0, y: 100, width: 400, height: 300)
        let chartView = ChartView(frame: frame)
        chartView.chartColor = .red
        view.addSubview(chartView)

    }

}
extension ChartViewController: chartViewDelegate {
    func chartView(_chartView: ChartView, didSectIndex: Int) {
        print("hihi \(didSectIndex).")
    }

}
