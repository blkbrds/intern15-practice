
import Foundation

final class BundleManager {
	var usersArray: [[User]] = []
	
	static func share() -> BundleManager {
		return bundleManager
	}

	static let bundleManager: BundleManager = {
		let bundleManager = BundleManager()
		return bundleManager
	}()
	
	private init() { }
	
	func getUsers(for resource: String) -> [User] {
		guard let url = Bundle.main.url(forResource: resource, withExtension: "plist"),
			let names = NSArray(contentsOf: url) as? [String] else {
				return []
		}
		return names.map({ User(name: $0) })
	}
	
	func loadAllUsers() {
		["name1", "name2", "name3"].forEach({
			let users = getUsers(for: $0)
			usersArray.append(users)
		})
	}

}


