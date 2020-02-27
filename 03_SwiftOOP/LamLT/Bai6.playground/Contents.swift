import UIKit

class HinhVe {

    func perimeter() {

    }

    func area() {

    }

    func volume() {

    }
}

class Hinh2Chieu: HinhVe {
    var name: String

    init(name: String) {
        self.name = name
    }
    override func perimeter() {
        print("Chu Vi \(name)")
    }

    override func area() {
        print("Dien Tich \(name)")
    }

    override func volume() {
        print("The Tich \(name)")
    }
}

class Hinh3chieu: HinhVe {
    var name: String

    init(name: String) {
        self.name = name
    }

    override func perimeter() {
        print("Chu Vi \(name)")
    }

    override func area() {
        print("Dien Tich \(name)")
    }

    override func volume() {
        print("The Tich \(name)")
    }

}

let tamGiac = Hinh2Chieu(name: "Tam Giac")
tamGiac.perimeter()
tamGiac.area()
tamGiac.volume()
let lapPhuong = Hinh3chieu(name: "Lap Phuong")
lapPhuong.perimeter()
lapPhuong.area()
lapPhuong.volume()
