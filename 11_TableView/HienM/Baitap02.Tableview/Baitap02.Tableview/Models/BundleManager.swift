import Foundation

final class BundleManager {

	static let shared: BundleManager = BundleManager()

	private init() { }

	func getUsers() -> [User] {
		guard let url = Bundle.main.url(forResource: "name", withExtension: "plist"),
			let names = NSArray(contentsOf: url) as? [String] else {
				return [User]()
		}
		return names.map({ User(name: $0) })
	}
}
