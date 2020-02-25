import SwiftUI

final class FxRectangularView: UIView {
 
	override func draw(_ rect: CGRect) {
        let path = createPath()
        let fillColor = UIColor.orange
        fillColor.setFill()
        path.fill()
    }
    
    private func createPath() -> UIBezierPath {
		let path = UIBezierPath(rect: self.bounds)
        return path
    }
}
