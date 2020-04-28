import UIKit

final class HomeCollectionViewCell: UICollectionViewCell {

    // MARK: - Outlet
    @IBOutlet weak private var imageView: UIImageView!
    @IBOutlet weak private var nameLabel: UILabel!
    @IBOutlet weak private var addressLabel: UILabel!
    @IBOutlet weak private var rateLabel: UILabel!
    @IBOutlet weak private var rangeLabel: UILabel!
    @IBOutlet weak private var favoriteButton: UIButton!

    // MARK: - Property
    var viewModel = HomeCellModel() {
        didSet {
            updateView()
        }
    }

    // MARK: - Private Function
    private func updateView() {
        let data = viewModel.data
        nameLabel.text = data.name
        imageView.image = UIImage(named: data.image)
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
