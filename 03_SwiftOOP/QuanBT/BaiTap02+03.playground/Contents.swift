import UIKit

class Polygons {
    var numberOfEdges: Int
    var lengthOfEdges: [Int]

    init(numberOfEdges: Int, lengthOfEdges: [Int]) {
        self.numberOfEdges = numberOfEdges
        self.lengthOfEdges = lengthOfEdges
    }

    func perimeter() -> Int {
        var result = 0
        for item in self.lengthOfEdges {
            result += item
        }
        return result
    }

    func printEdges() -> String {
        var str = "Các cạnh của đa giác là: "
        for i in self.lengthOfEdges {
            str = str + String(i) + " "
        }
        return str
    }
}

var rectangle: Polygons = Polygons(numberOfEdges: 4, lengthOfEdges: [3,3,5,5])
print(rectangle.printEdges())
print("Chu vi đa giác này là : \(rectangle.perimeter())")

final class Triangle: Polygons {
    override func perimeter() -> Int {
        var result = 0
        for item in self.lengthOfEdges {
            result += item
        }
        return result
    }
    
    func area() -> Double {
        var result: Double = 1
        for i in self.lengthOfEdges{
            result *= Double(perimeter() / 2 - i)
        }
        result *= Double(perimeter() / 2)
        return sqrt(result)
    }
}

var triangle: Triangle = Triangle(numberOfEdges: 3, lengthOfEdges: [3,4,5])
print(triangle.printEdges())
print("Chu vi tam giác này là: \(triangle.perimeter())")
print("Diện tích của tam giác này là: \(triangle.area())")


