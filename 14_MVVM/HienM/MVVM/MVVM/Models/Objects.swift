import UIKit

final class CofeeRestaurant {
	var name: String
	var address: String
	var image: String
	var rate: String
	var favorite: String
	init(name: String, address: String, image: String, rate: String, favorite: String) {
		self.name = name
		self.address = address
		self.image = image
		self.rate = rate
		self.favorite = favorite
	}
}
extension CofeeRestaurant {
	struct DummyData {
		static var slidesImage: [CofeeRestaurant] = {
			let places = [CofeeRestaurant(name: "1975 Coffee", address: "123 Tran Phu", image: "1975 Coffee", rate: "4.1", favorite: "like"),
				CofeeRestaurant(name: "Aquarium Coffee", address: "12 Thai Phien", image: "Aquarium Coffee", rate: "5.1", favorite: "Love"),
				CofeeRestaurant(name: "Coc Coffee", address: "23 Hai Trieu", image: "Coc Coffee", rate: "3.1", favorite: "cc"),
				CofeeRestaurant(name: "Cong Coffee", address: "392 Hai Phong", image: "Cong Coffee", rate: "1.3", favorite: "like"),
				CofeeRestaurant(name: "Dau Ngot Coffee", address: "23 Le Loi", image: "Dau Ngot Coffee", rate: "3.2", favorite: ""),
				CofeeRestaurant(name: "Han Coffee", address: "34 Nguyen Thai Hoc", image: "Han Coffee", rate: "2.3", favorite: ""),
				CofeeRestaurant(name: "May Coffee", address: "43 Le Lai", image: "May Coffee", rate: "1.9", favorite: ""),
				CofeeRestaurant(name: "Moon Coffee", address: "22 Yet Kieu", image: "Moom Coffee", rate: "9.1", favorite: ""),
				CofeeRestaurant(name: "Nia Coffice", address: "44 Hai Phong", image: "Nia Coffice", rate: "2.3", favorite: ""),
				CofeeRestaurant(name: "Papa Container Coffee", address: "23 Bac Gian", image: "Papa Container Coffee", rate: "3.1", favorite: ""),
				CofeeRestaurant(name: "Sunrise Coffee", address: "32 Pastur", image: "Sunrise Coffee", rate: "7.1", favorite: ""),
				CofeeRestaurant(name: "Thung Coffee", address: "312 Phan Chu Trinh", image: "Thung Coffee", rate: "6.4", favorite: "")

			]
			return places
		}()
	}
}
