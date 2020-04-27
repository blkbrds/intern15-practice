import UIKit

final class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var imageCafeView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var rangeLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!

    var viewModel = HomeCellModel() {
        didSet {
            updateView()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    private func updateView() {
        let data = viewModel.data
        nameLabel.text = data.name
        imageCafeView.image = UIImage(named: data.image)
        addressLabel.text = data.address
        rateLabel.text = data.rate
        rangeLabel.text = data.range
        if data.favorite {
            favoriteButton.tintColor = .systemYellow
            favoriteButton.isSelected = false
        } else {
            favoriteButton.tintColor = .black
            favoriteButton.isSelected = true
        }
    }

    @IBAction private func favoriteButtonTouchUpInside(_ sender: Any) {
        if favoriteButton.isSelected {
            favoriteButton.tintColor = .systemYellow
            favoriteButton.isSelected = false
            viewModel.data.favorite = true
        } else {
            favoriteButton.tintColor = .black
            favoriteButton.isSelected = true
            viewModel.data.favorite = false
        }
    }
}
