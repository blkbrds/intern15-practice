import UIKit

final class Monkey2ViewController: UIViewController {
    @IBOutlet private weak var monkeyImageView: UIImageView!
    @IBOutlet private weak var mesageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        monkeyImageView.image = UIImage(named: "monkey")
        setupLabel()
    }
    
    private func setupLabel() {
        mesageLabel.text = "Tôi là Khỉ "
        mesageLabel.layer.borderWidth = 1
        mesageLabel.layer.borderColor = UIColor.black.cgColor
        mesageLabel.backgroundColor = .blue
        mesageLabel.textColor = .white
        mesageLabel.textAlignment = .center
        mesageLabel.layer.cornerRadius = 30
        mesageLabel.clipsToBounds = true
        mesageLabel.alpha = 0
    }
    
    @IBAction private func oneTap(_ sender: UITapGestureRecognizer) {
        if sender.view != nil {
            UIView.animate(withDuration: 1, animations: {
                self.mesageLabel.alpha = 1
                self.mesageLabel.text = "Tôi là Khỉ"
            })
            UIView.animate(withDuration: 1, delay: 5, options: [], animations: {
                self.mesageLabel.alpha = 0
            })
        }
    }
    
    @IBAction private func doubleTap(_ sender: UITapGestureRecognizer) {
        if sender.view != nil {
            UIView.animate(withDuration: 1, animations: {
                self.mesageLabel.alpha = 1
                self.mesageLabel.text = "Khỉ là Tôi"
            })
            UIView.animate(withDuration: 1, delay: 5, options: [], animations: {
                self.mesageLabel.alpha = 0
            })
        }
    }
}
