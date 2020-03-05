import Foundation

final class HomeViewModel {

	// MARK: - Properties
//	private(set) var names: [String] = []
	private(set) var musics: [Music] = []

	// MARK: - Public function
	func getHotMusic(completion: @escaping Completion) {
		APIManager.Music.getHotMusic { (result) in
			switch result {
			case .failure(let error):
				// call back
				completion(false, error.localizedDescription)
			case .success(let musicResult):
				self.musics.append(contentsOf: musicResult.musics)
				// call back
				completion(true, "")
			}
		}
	}

	func downloadImage(withURL url: String, completion: @escaping DownloadImageCompletion) {
		Networking.shared().downloadImage(url: url) { (image) in
			completion(image)
		}
	}

	func getMusicTableViewCellModel(atIndexPath indexPath: IndexPath) -> MusicTableViewCellModel? {
		guard indexPath.row < musics.count else { return nil }
		return MusicTableViewCellModel(imageUrl: musics[indexPath.row].artworkUrl100, songName: musics[indexPath.row].artistName, indexPath: indexPath)
	}
}
