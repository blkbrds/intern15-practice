import UIKit

final class AutoLayout10ViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet private var widthsOutlet: [NSLayoutConstraint]!
    
     // MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - Function
    @IBAction private func tapGestureViolet(_ sender: UITapGestureRecognizer) {
        widthsOutlet[1].constant = 200
        widthsOutlet[0].constant = 100
        widthsOutlet[2].constant = 100
        widthsOutlet[3].constant = 100
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction private func tapGestureYellow(_ sender: UITapGestureRecognizer) {
        widthsOutlet[2].constant = 200
        widthsOutlet[0].constant = 100
        widthsOutlet[1].constant = 100
        widthsOutlet[3].constant = 100
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction private func tapGestureOrange(_ sender: UITapGestureRecognizer) {
        widthsOutlet[3].constant = 200
        widthsOutlet[0].constant = 100
        widthsOutlet[1].constant = 100
        widthsOutlet[2].constant = 100
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction private func tapGestureGreen(_ sender: UITapGestureRecognizer) {
    widthsOutlet[0].constant = 200
    widthsOutlet[1].constant = 100
    widthsOutlet[2].constant = 100
    widthsOutlet[3].constant = 100
    UIView.animate(withDuration: 0.5) {
        self.view.layoutIfNeeded()
        }
    }
}
