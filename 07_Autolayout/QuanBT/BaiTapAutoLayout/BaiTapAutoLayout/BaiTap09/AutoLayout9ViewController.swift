import UIKit

final class AutoLayout9ViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var contentLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    // MARK: - Declare Variable
    var test = 1
    let content = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce consectetur ante non dolor pellentesque interdum. Mauris eget leo ut quam aliquet semper quis nec ante. Maecenas fringilla tempus mauris, non lobortis lorem ultrices at. Fusce aliquam commodo luctus. Proin pretium iaculis scelerisque. Pellentesque tempus vulputate nunc sit amet convallis. Fusce mattis ultrices lectus non auctor. Vestibulum sit amet magna et arcu cursus commodo sit amet in ipsum. Integer gravida tellus et eros ultricies viverra."
    
    // MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Function
    private func setupView() {
        scrollView.contentSize = CGSize(width: scrollView.bounds.width * 10, height: scrollView.bounds.height)
        for index in 0 ... 9 {
            let imageView = UIImageView(image: UIImage(named: String(index + 1)))
            imageView.frame = CGRect(x: scrollView.bounds.width * CGFloat(index), y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height)
            scrollView.addSubview(imageView)
        }
        contentLabel.text = String(content.prefix(Int.random(in: 50...content.count)))
        titleLabel.text = "1/10"
    }
    
    // MARK: - IBAction
    @IBAction private func chevronRightButtonTouchUpInside(_ sender: Any) {
        if self.test == 10 {
            return
        }
        test += 1
        UIView.animate(withDuration: 1, animations: {
            self.scrollView.contentOffset = CGPoint(x: CGFloat(self.test - 1) * self.scrollView.bounds.width, y: 0)
        })
        contentLabel.text = String(content.prefix(Int.random(in: 50...content.count)))
        titleLabel.text = "\(test)/10"
    }
    
    @IBAction private func chevronLeftButtonTouchUpInside(_ sender: Any) {
        if self.test == 1 {
            return
        }
        test -= 1
        UIView.animate(withDuration: 1, animations: {
            self.scrollView.contentOffset = CGPoint(x: CGFloat(self.test - 1) * self.scrollView.bounds.width, y: 0)
        })
        contentLabel.text = String(content.prefix(Int.random(in: 50...content.count)))
        titleLabel.text = "\(test)/10"
    }
}
