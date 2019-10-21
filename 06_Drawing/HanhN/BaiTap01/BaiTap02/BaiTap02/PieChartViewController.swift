
import UIKit

class PieChartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let pieChartView = PieChartView()
        pieChartView.frame = CGRect(x: 20, y: 150, width: view.frame.size.width, height: 400)
        pieChartView.segments = [
            Segment(color: .red, value: 57),
            Segment(color: .blue, value: 30),
            Segment(color: .green, value: 25),
            Segment(color: .yellow, value: 40)
        ]
        view.addSubview(pieChartView)
        // Do any additional setup after loading the view.
    }
}
extension PieChartViewController: pieChartViewDelegate {
    func pieChartView(_piechartView: PieChartView, didSect index: Int) {
        print("hihi \(index).")
    }
}
