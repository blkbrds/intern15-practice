import UIKit

class Polygons {
    var numberEdges: Int = 3
    var lengthEdges = [Int]()

    init(lengthEdges: [Int]) {
        self.lengthEdges = lengthEdges
    }
    init(numberEdges: Int, lengthEdges: [Int]) {
        self.numberEdges = numberEdges
        self.lengthEdges = lengthEdges
    }

    func printWidthEdges(p: Polygons) {
        let instaneOfNumberEdges = p.numberEdges
        let instaneOfLengthEdges = p.lengthEdges
        if instaneOfLengthEdges.count < instaneOfNumberEdges {
            print("can't print")
        } else {
            for index in 0..<instaneOfLengthEdges.count {
                print(instaneOfLengthEdges[index])
            }
        }
    }

    func calculaterPerimeter(p: Polygons) -> Float {
        let instaneOfLengthEdges = p.lengthEdges
        var per: Float = 0
        for i in 0..<instaneOfLengthEdges.count {
            per = per + Float(instaneOfLengthEdges[i])
        }
        print(per)
        return per
    }
}

let pol1 = Polygons(numberEdges: 5, lengthEdges: [1, 6, 3, 2, 6])
pol1.printWidthEdges(p: pol1)
pol1.calculaterPerimeter(p: pol1)

let pol2 = Polygons(lengthEdges: [1, 6, 3])
pol1.printWidthEdges(p: pol2)
pol1.calculaterPerimeter(p: pol2)

class Triganle: Polygons {

}

let tri1 = Triganle(lengthEdges: [4, 5, 7])
tri1.printWidthEdges(p: tri1)
tri1.calculaterPerimeter(p: tri1)
