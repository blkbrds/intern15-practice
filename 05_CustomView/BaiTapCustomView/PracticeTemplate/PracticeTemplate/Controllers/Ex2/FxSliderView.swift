
import UIKit

protocol FxSliderViewDelegate: class {
    func fxSliderView(view: FxSliderView, didChangedWith percent: Float)
}

class FxSliderView: UIView {

    weak var delegate: FxSliderViewDelegate?

    @IBOutlet weak var thumbView: UIView!
    @IBOutlet weak var valueImageView: UIImageView!

    func setValue(percent: Float) {
        let y = Float(frame.size.height) / 100 * (100 - percent)
        var center = thumbView.center
        center.y = CGFloat(y)

        thumbView.center = center

        let newFrame = CGRect(x: 0,
            y: CGFloat(y),
            width: frame.size.width,
            height: frame.size.height - CGFloat(y))
        valueImageView.frame = newFrame
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            if touch.view == thumbView {
                let location = touch.location(in: self)

                if location.y >= 0 && location.y <= self.frame.size.height {

                    //percent
                    let percent = 100 - Float(location.y / frame.size.height * 100)
                    setValue(percent: percent)

                    if let delegate = delegate {
                        delegate.fxSliderView(view: self, didChangedWith: percent)
                    }
                }
            }
        }
    }

}
