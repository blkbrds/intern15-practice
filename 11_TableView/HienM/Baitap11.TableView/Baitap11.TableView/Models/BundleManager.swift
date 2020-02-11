
import Foundation
class BundleManager {
	
	private init() { }
	
	static func share () -> BundleManager {
		return bundleManager
	}

	static let bundleManager: BundleManager = {
		let bundleManager = BundleManager()
		return bundleManager
	}()
	
	func getPoems () -> [Poem] {
		guard let url = Bundle.main.url(forResource: "Poems", withExtension: "plist"),
		let poems = NSArray(contentsOf: url) as? [String] else {
			return [Poem]()
		}
		return poems.map({ Poem(poemText: $0) })
	}
}
