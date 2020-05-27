import UIKit

final class HomeTableViewCell: UITableViewCell {

    // MARK: - Outlet
    @IBOutlet weak private var imageCafeView: UIImageView!
    @IBOutlet weak private var nameLabel: UILabel!
    @IBOutlet weak private var addressLabel: UILabel!
    @IBOutlet weak private var rateLabel: UILabel!
    @IBOutlet weak private var rangeLabel: UILabel!
    @IBOutlet weak private var favoriteButton: UIButton!

    // MARK: - Properties
    var viewModel = HomeCellModel() {
        didSet {
            updateView()
        }
    }

    // MARK: - Private Funtion
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

    // MARK: - Action
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
