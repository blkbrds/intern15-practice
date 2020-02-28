import UIKit
protocol FirstCollectionViewCellDelegate : class {
	func firstCollectionViewCell(viewCell: UICollectionViewCell, didSelectWith index: Int)
}
class FirstCollectionViewCell: UICollectionViewCell {

	var viewModel: FirstCollectionViewModel? {
		didSet {
			updateData()
		}
	}
	weak var delegate : FirstCollectionViewCellDelegate?

	@IBOutlet weak var imageCoffeeL: UIImageView!
	@IBOutlet weak var ratingL: UILabel!
	@IBOutlet weak var nameCoffeeL: UILabel!
	@IBOutlet weak var adressCoffeeeL: UILabel!
	@IBOutlet weak var favoriteBtn: UIButton!
	var tapping: Bool = true

	override func awakeFromNib() {
		super.awakeFromNib()
	}

	private func updateData() {
		imageCoffeeL.image = UIImage(named: viewModel!.coffeeImageName)
		nameCoffeeL.text = viewModel?.coffeeName
		adressCoffeeeL.text = viewModel?.addressCoffee
		ratingL.text = viewModel?.rating
	}

	@IBAction func favoriteBtnTapped(_ sender: UIButton) {
		if tapping {
			favoriteBtn.setImage(UIImage(named: "star"), for: .normal)
			favoriteBtn.setTitle("", for: .normal)
			tapping = false
		} else {
			favoriteBtn.setImage(UIImage(named: "star.fill"), for: .normal)
			favoriteBtn.setTitle("", for: .normal)
			tapping = true
		}
	}
}
