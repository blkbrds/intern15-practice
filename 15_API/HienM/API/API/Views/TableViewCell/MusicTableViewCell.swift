import UIKit

final class MusicTableViewCell: UITableViewCell {

	// MARK: - Outlets
	@IBOutlet private weak var musicImageView: UIImageView!
	@IBOutlet private weak var songNameLabel: UILabel!
	
	// MARK: - Properties
	var viewModel: MusicTableViewCellModel? {
		didSet {
			updateUI()
		}
	}

	// MARK: - Life cycle
	override func awakeFromNib() {
		super.awakeFromNib()
		setupUI()
	}
	
	// MARK: - Private
	private func setupUI() {
		musicImageView?.layer.cornerRadius = 10
		
		musicImageView.layer.shadowColor = UIColor(displayP3Red: 0 / 255, green: 0 / 255, blue: 0 / 255, alpha: 1.0).cgColor
		songNameLabel.layer.shadowOffset = CGSize(width: 30, height: 30.75)
		musicImageView.layer.shadowRadius = 1.75
		musicImageView.layer.shadowOpacity = 1.45
	//	musicImageView.layer.borderWidth = 2
		//musicImageView.layer.borderColor = UIColor(displayP3Red: 0 / 255, green: 0 / 255, blue: 0 / 255, alpha: 1.0).cgColor
		musicImageView?.clipsToBounds = false
		musicImageView?.layer.masksToBounds = false
		
	}
	
	private func updateUI() {
		guard let viewModel = viewModel else { return }
		songNameLabel.text = viewModel.songName
	}
	
	// MARK: - Public function
	func updateSongImage(image: UIImage?) {
		musicImageView.image = image
	}
}
