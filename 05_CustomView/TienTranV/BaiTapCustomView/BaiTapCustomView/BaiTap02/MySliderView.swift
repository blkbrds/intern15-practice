import UIKit

protocol MySliderViewDelegate: class {
    func mySlider(mySlider: MySliderView, needPerformAction action: MySliderView.Action)
}

protocol MySliderViewDatasource: class {
    func getValue(mySlider: MySliderView) -> Int
}

final class MySliderView: UIView {
    
    enum Action {
        case getPercent(Int)
    }
    
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var thumbnailLabel: UILabel!
    @IBOutlet private weak var colorImageView: UIImageView!

    weak var delegate: MySliderViewDelegate?
    weak var datasource: MySliderViewDatasource?

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    private func setupUI() {
        Bundle.main.loadNibNamed("MySlider", owner: self, options: nil)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        addSubview(contentView)
    }

    func updateUI() {
        guard let getValuePercent = datasource?.getValue(mySlider: self) else { return }

        let thumbnailLabelHeight = contentView.frame.maxY - CGFloat(getValuePercent) * 340 / 100 - 20
        thumbnailLabel.center = CGPoint(x: contentView.center.x, y: thumbnailLabelHeight)

        colorImageView.frame = CGRect(x: contentView.frame.minX, y: thumbnailLabel.center.y, width: contentView.frame.width, height: contentView.frame.maxY - thumbnailLabel.center.y)

        thumbnailLabel.text = "\(getValuePercent)"
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)

        if let touch = touches.first {
            let position = touch.location(in: self.contentView)
            if position.x >= thumbnailLabel.frame.minX,
                position.x <= thumbnailLabel.frame.maxX,
                position.y >= thumbnailLabel.frame.minY,
                position.y <= thumbnailLabel.frame.maxY,
                position.y >= contentView.frame.minY + 20,
                position.y <= contentView.frame.maxY - 20 {

                thumbnailLabel.center = CGPoint(x: contentView.center.x, y: position.y)

                colorImageView.frame = CGRect(x: contentView.frame.minX, y: thumbnailLabel.center.y, width: contentView.frame.width, height: contentView.frame.maxY - thumbnailLabel.center.y)

                let a = colorImageView.frame.height - 20
                let b: CGFloat = 340
                let percentSlider = 100 * a / b

                thumbnailLabel.text = "\(Int(percentSlider))"
                delegate?.mySlider(mySlider: self, needPerformAction: Action.getPercent(Int(percentSlider)))
            }
        }
    }
}
