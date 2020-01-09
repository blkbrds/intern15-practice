import SwiftUI

class FxRectangularView: UIView {
 
	override func draw(_ rect: CGRect) {
        let path = createPath()
        let fillColor = UIColor.orange
        fillColor.setFill()
        path.fill()
    }
    
    func createPath() -> UIBezierPath {
		let path = UIBezierPath(rect: self.bounds)
        return path
    }
}
