import UIKit

final class SecondTableViewCell: UITableViewCell {
	
	var viewModel: SecondTableViewModel? {
		didSet {
			updateData()
		}
	}
	
	@IBOutlet weak private var caffeImage: UIImageView!
	@IBOutlet weak private var nameCoffeeL: UILabel!
	@IBOutlet weak private var addressCoffeeL: UILabel!
	@IBOutlet weak private var ratingL: UILabel!
	@IBOutlet weak private var favoriteBtn: UIButton!
	private var tapping: Bool = true

	override func awakeFromNib() {
		super.awakeFromNib()
	}
	
	override func prepareForReuse() {
		super.prepareForReuse()
		favoriteBtn.setImage(UIImage(named: "star.fill"), for: .normal)
		favoriteBtn.setTitle("", for: .normal)
		tapping = true
	}
	
	private func updateData() {
		caffeImage.image = UIImage(named: viewModel!.nameCoffeeImage)
		nameCoffeeL.text = viewModel?.nameCoffee
		addressCoffeeL.text = viewModel?.addressCoffee
		ratingL.text = viewModel?.rating
		favoriteBtn.setImage(UIImage(named: viewModel!.favoriteBtnImage), for: .normal)
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
