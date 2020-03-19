import UIKit

protocol SliderViewDelegate: class {
    func changeValue(value: CGFloat)
}

final class MySliderView: UIView {
    // MARK: - Declare Variable
    private var label: UILabel = UILabel(frame: .zero)
    private var shapeLayer2 = CAShapeLayer()
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
    
    // MARK: - Private function
    private func setupUIView() {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: self.frame.size.width/2, y: self.frame.size.height))
        path.addLine(to: CGPoint(x: 0.0, y: 0.0))
        path.addLine(to: CGPoint(x: self.frame.size.width, y: 0.0))
        path.close()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 1.0
        shapeLayer.fillColor = .none
        shapeLayer.path = path.cgPath
        self.layer.addSublayer(shapeLayer)
        
        sliderView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 400))
        addSubview(sliderView)
        
        let path2 = UIBezierPath()
        path2.move(to: CGPoint(x: self.frame.size.width/2, y: self.frame.size.height))
        path2.addLine(to: CGPoint(x: 0.0, y: 0.0))
        path2.addLine(to: CGPoint(x: self.frame.size.width, y: 0.0))
        path2.close()
        
        shapeLayer2.strokeColor = UIColor.blue.cgColor
        shapeLayer2.lineWidth = 1.0
        shapeLayer2.fillColor = UIColor.blue.cgColor
        shapeLayer2.path = path2.cgPath
        sliderView.layer.addSublayer(shapeLayer2)
        
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
    }
    
    @objc private func handlePan(sender: UIPanGestureRecognizer){
        let transition = sender.translation(in: self)
        guard label.center.y + transition.y <= frame.height - 20 && label.center.y + transition.y + 1 >= 0 else { return }
        label.center = CGPoint(x: label.center.x, y: label.center.y + transition.y)
        sender.setTranslation(CGPoint.zero, in: self)
        value = (frame.height - 20 - label.center.y) * 100.0 / (frame.height - 20)
        isChange = true
        delegate?.changeValue(value: value)
        sliderView.frame = CGRect(x: 0, y: label.center.y, width: 80 , height: frame.height * value / 100)
    }
    
    func updateUI() {
        label.text = "\(Int(value))"
        if !isChange {
            label.frame = CGRect(x: 0, y: frame.height - 20 - CGFloat(value) / 100.0 * frame.height, width: frame.width, height: 40)
            
        }
        setNeedsDisplay()
    }
}
