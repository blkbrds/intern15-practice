import UIKit
class Date {
	var day: Int
	var month: Int
	var year: Int

	init(day: Int, month: Int, year: Int) {
		self.day = day
		self.month = month
		self.year = year
	}

	func daysln() -> Int {
		var daysl: Int = 0
		switch self.month {
		case 4, 6, 9, 11:
			daysl = 30
		case 1, 3, 5, 7, 8, 10, 12:
			daysl = 31
		default:
			if year % 4 == 0 { daysl = 29 }
			else {
				daysl = 28
			}
		}
		return daysl
	}

	func normalize() -> Date? {
		guard day < daysln() else {
			return nil
		}
		guard month < 12 else {
			return nil
		}
		guard year > 1 else {
			return nil
		}
		return self
	}

	func printNow() {
		print("\(day) \(month) \(year) ")
	}

	func advance(ngay: Int, thang: Int, nam: Int) {
		self.day = ngay + 1
		self.month = thang
		self.year = nam
	}
}

let x = Date(day: 45, month: 2, year: 4)
x.daysln()
x.normalize()
