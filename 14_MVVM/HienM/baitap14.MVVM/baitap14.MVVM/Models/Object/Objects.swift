import UIKit
final class Place {
	var name: String
	var address: String
	var image: UIImage
	var rate: String
	var favorite: String
	init(name: String, address: String, image: UIImage, rate: String, favorite: String) {
		self.name = name
		self.address = address
		self.image = image
		self.rate = rate
		self.favorite = favorite
	}
}
extension Place {
	struct DummyData {
		static var slidesImage: [Place] = {
			let slides = [Place(name: "1975 Coffee", address: "123 Tran Phu", image: #imageLiteral(resourceName: "1975 Coffee"), rate: "4.1", favorite: "like"),
				Place(name: "Aquarium Coffee", address: "12 Thai Phien", image: #imageLiteral(resourceName: "Aquarium Coffee"), rate: "5.1", favorite: "Love"),
				Place(name: "Coc Coffee", address: "23 Hai Trieu", image: #imageLiteral(resourceName: "Coc Coffee"), rate: "3.1", favorite: "cc"),
				Place(name: "Cong Coffee", address: "392 Hai Phong", image: #imageLiteral(resourceName: "Cong Coffee"), rate: "1.3", favorite: "like"),
				Place(name: "Dau Ngot Coffee", address: "23 Le Loi", image: #imageLiteral(resourceName: "Dau Ngot Coffee"), rate: "3.2", favorite: ""),
				Place(name: "Han Coffee", address: "34 Nguyen Thai Hoc", image: #imageLiteral(resourceName: "Han Coffee"), rate: "2.3", favorite: ""),
				Place(name: "May Coffee", address: "43 Le Lai", image: #imageLiteral(resourceName: "May Coffee"), rate: "1.9", favorite: ""),
				Place(name: "Moob Coffee", address: "22 Yet Kieu", image: #imageLiteral(resourceName: "Moob Coffee"), rate: "9.1", favorite: ""),
				Place(name: "Nia Coffee", address: "44 Hai Phong", image: #imageLiteral(resourceName: "Nia Coffee"), rate: "2.3", favorite: ""),
				Place(name: "Papa Container Coffee", address: "23 Bac Gian", image: #imageLiteral(resourceName: "Papa Container Coffee"), rate: "3.1", favorite: ""),
				Place(name: "Sunrise Coffee", address: "32 Pastur", image: #imageLiteral(resourceName: "Sunrise Coffee"), rate: "7.1", favorite: ""),
				Place(name: "Thung Coffee", address: "312 Phan Chu Trinh", image: #imageLiteral(resourceName: "Thung Coffee"), rate: "6.4", favorite: "")

			]
			return slides
		}()
		static var places: [Place] = {
			let places = [Place(name: "1975 Coffee", address: "123 Tran Phu", image: #imageLiteral(resourceName: "1975 Coffee"), rate: "4.1", favorite: "like"),
				Place(name: "Aquarium Coffee", address: "12 Thai Phien", image: #imageLiteral(resourceName: "Aquarium Coffee"), rate: "5.1", favorite: "Love"),
				Place(name: "Coc Coffee", address: "23 Hai Trieu", image: #imageLiteral(resourceName: "Coc Coffee"), rate: "3.1", favorite: "cc"),
				Place(name: "Cong Coffee", address: "392 Hai Phong", image: #imageLiteral(resourceName: "Cong Coffee"), rate: "1.3", favorite: "like"),
				Place(name: "Dau Ngot Coffee", address: "23 Le Loi", image: #imageLiteral(resourceName: "Dau Ngot Coffee"), rate: "3.2", favorite: ""),
				Place(name: "Han Coffee", address: "34 Nguyen Thai Hoc", image: #imageLiteral(resourceName: "Han Coffee"), rate: "2.3", favorite: ""),
				Place(name: "May Coffee", address: "43 Le Lai", image: #imageLiteral(resourceName: "May Coffee"), rate: "1.9", favorite: ""),
				Place(name: "Moob Coffee", address: "22 Yet Kieu", image: #imageLiteral(resourceName: "Moob Coffee"), rate: "9.1", favorite: ""),
				Place(name: "Nia Coffee", address: "44 Hai Phong", image: #imageLiteral(resourceName: "Nia Coffee"), rate: "2.3", favorite: ""),
				Place(name: "Papa Container Coffee", address: "23 Bac Gian", image: #imageLiteral(resourceName: "Papa Container Coffee"), rate: "3.1", favorite: ""),
				Place(name: "Sunrise Coffee", address: "32 Pastur", image: #imageLiteral(resourceName: "Sunrise Coffee"), rate: "7.1", favorite: ""),
				Place(name: "Thung Coffee", address: "312 Phan Chu Trinh", image: #imageLiteral(resourceName: "Thung Coffee"), rate: "6.4", favorite: "")
			]
			return places
		}()
	}
}
