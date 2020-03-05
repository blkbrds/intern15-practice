import Foundation
final class BundleManager {

	private init() { }

	static func share () -> BundleManager {
		return bundleManager
	}

	static let bundleManager: BundleManager = {
		let bundleManager = BundleManager()
		return bundleManager
	}()

	func getPoems () -> [ThePoem] {
		guard let url = Bundle.main.url(forResource: "Poems", withExtension: "plist"),
			let poems = NSArray(contentsOf: url) as? [String] else {
				return [ThePoem]()
		}
		return poems.map({ ThePoem(poemText: $0) })
	}
}
