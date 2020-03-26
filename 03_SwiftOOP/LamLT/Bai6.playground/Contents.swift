import UIKit

class HinhVe {

    func calculaterPerimeter() {

    }

    func calculaterArea() {

    }

    func calculaterVolume() {

    }
}

class Hinh2Chieu: HinhVe {
    var name: String

    init(name: String) {
        self.name = name
    }
    override func calculaterPerimeter() {
        print("Chu Vi \(name)")
    }

    override func calculaterArea() {
        print("Dien Tich \(name)")
    }

    override func calculaterVolume() {
        print("The Tich \(name)")
    }
}

class Hinh3chieu: HinhVe {
    var name: String

    init(name: String) {
        self.name = name
    }

    override func calculaterPerimeter() {
        print("Chu Vi \(name)")
    }

    override func calculaterArea() {
        print("Dien Tich \(name)")
    }

    override func calculaterVolume() {
        print("The Tich \(name)")
    }

}

let tamGiac = Hinh2Chieu(name: "Tam Giac")
tamGiac.calculaterPerimeter()
tamGiac.calculaterArea()
tamGiac.calculaterVolume()
let lapPhuong = Hinh3chieu(name: "Lap Phuong")
lapPhuong.calculaterPerimeter()
lapPhuong.calculaterArea()
lapPhuong.calculaterVolume()
