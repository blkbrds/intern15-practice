import UIKit

protocol SliderViewDelegate: class {
    func changeValue(value: CGFloat)
}

final class MySliderView: UIView {
    // MARK: - Declare Variable
    private var label: UILabel = UILabel(frame: .zero)
    private var sliderView: UIView = UIView(frame: .zero)
    
    weak var delegate: SliderViewDelegate?
    var isChange = false
    var value: CGFloat = 100 {
        didSet {
            updateUI()
        }
    }
    
    //MARK: - Override
    override init(frame: CGRect){
        super.init(frame: frame)
        setupUIView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        let percent: CGFloat = value / 100.0
        let context = UIGraphicsGetCurrentContext()
        context?.setStrokeColor(UIColor.green.cgColor)
        context?.move(to: CGPoint(x: 0, y: 0))
        context?.addLine(to: CGPoint(x: self.bounds.midX, y: self.bounds.maxY - 20))
        context?.addLine(to: CGPoint(x: self.bounds.width, y: 0))
        context?.addLine(to: CGPoint.zero)
        context?.setLineWidth(1)
        context?.setStrokeColor(UIColor.blue.cgColor)
        context?.setFillColor(UIColor.white.cgColor)
        context?.strokePath()
        context?.closePath()
        context?.fillPath()
        
        let context1 = UIGraphicsGetCurrentContext()
        context1?.move(to: CGPoint(x: self.bounds.midX, y: self.bounds.maxY - 20))
        context1?.addLine(to: CGPoint(x: self.bounds.midX + self.bounds.width / 2 * percent, y: self.bounds.maxY - self.bounds.height * percent - 20))
        context1?.addLine(to: CGPoint(x: self.bounds.midX - self.bounds.width / 2 * percent, y: self.bounds.maxY - self.bounds.height * percent - 20))
        context1?.addLine(to: CGPoint(x: self.bounds.midX, y: self.bounds.maxY - 20))
        context1?.setFillColor(UIColor.systemBlue.cgColor)
        context1?.fillPath()
    }
    
    // MARK: - Private function
    private func setupUIView() {
        
        label = UILabel(frame: CGRect(x: 0, y: frame.height - 20 - CGFloat(value) / 100.0 * frame.height, width: frame.width, height: 40))
        label.text = "100"
        label.textAlignment = .center
        label.backgroundColor = .gray
        label.textColor = .white
        label.layer.borderWidth = 2
        label.layer.borderColor = UIColor.black.cgColor
        addSubview(label)
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(panGestureRecognizer)
        backgroundColor = .white
    }
    
    @objc private func handlePan(sender: UIPanGestureRecognizer){
        let transition = sender.translation(in: self)
        guard label.center.y + transition.y <= frame.height - 20 && label.center.y + transition.y + 1 >= 0 else { return }
        label.center = CGPoint(x: label.center.x, y: label.center.y + transition.y)
        sender.setTranslation(CGPoint.zero, in: self)
        value = (frame.height - 20 - label.center.y) * 100.0 / (frame.height - 20)
        isChange = true
        delegate?.changeValue(value: value)
    }
    
    func updateUI() {
        label.text = "\(Int(value))"
        if !isChange {
            label.frame = CGRect(x: 0, y: frame.height - 20 - CGFloat(value) / 100.0 * frame.height, width: frame.width, height: 40)
            
        }
        setNeedsDisplay()
    }
}
