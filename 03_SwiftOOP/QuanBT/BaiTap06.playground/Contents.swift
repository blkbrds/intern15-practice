import UIKit

class Geometry {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func printInfo() {
        print("Hình này là: \(self.name)")
    }
}

class TwoDimensionalGeometry: Geometry {
    var numberOfEdges: Int
    
    init(name: String, numberOfEdges: Int) {
        self.numberOfEdges = numberOfEdges
        super.init(name: name)
    }
    
    override func printInfo() {
        super.printInfo()
        print("Hình này có: \(self.numberOfEdges) Cạnh")
    }
    
    func perimeter() {
    }
    
    func acreage() {
    }
}

class ThreeDimensionalGeometry: Geometry {
    var numberOfEdges: Int
    
    init(name: String, numberOfEdges: Int) {
        self.numberOfEdges = numberOfEdges
        super.init(name: name)
    }
    
    override func printInfo() {
        super.printInfo()
        print("Hình này có: \(self.numberOfEdges) Cạnh")
    }
    
    func acreage() {
    }
    
    func volume() {
    }
}

final class Circles: TwoDimensionalGeometry {
    var radius: Int
    
    init(name: String, numberOfEdges: Int, radius: Int) {
        self.radius = radius
        super.init(name: name, numberOfEdges: numberOfEdges)
    }
    
    override func perimeter() {
        let perimeter: Double = 2 * Double(self.radius) * 3.14
        print("Chu vi hình tròn là: \(perimeter)")
    }
    
    override func acreage() {
        let acreage: Double = 3.14 * Double(self.radius) * Double(self.radius)
        print("Diện tích hình tròn là: \(acreage)")
    }
}

var circle: Circles = Circles(name: "Hình Tròn", numberOfEdges: 1, radius: 4)
circle.printInfo()
circle.perimeter()
circle.acreage()

final class Squares: TwoDimensionalGeometry {
    var edgeLength: Int
    
    init(name: String, numberOfEdges: Int, edgeLength: Int) {
        self.edgeLength = edgeLength
        super.init(name: name, numberOfEdges: numberOfEdges)
    }

    override func perimeter() {
        let perimeter = self.edgeLength * 4
        print("Chu vi hình vuông là: \(perimeter)")
    }
    
    override func acreage() {
        let acreage = self.edgeLength * self.edgeLength
        print("Diện tích hình vuông là: \(acreage)")
    }
}

var square: Squares = Squares(name: "Hình Vuông", numberOfEdges: 4, edgeLength: 8)
square.printInfo()
square.perimeter()
square.acreage()

final class Triangles: TwoDimensionalGeometry {
    var edgeLength: (Double, Double, Double)
    
    init(name: String, numberOfEdges: Int, edgeLength: (Double, Double, Double)) {
        self.edgeLength = edgeLength
        super.init(name: name, numberOfEdges: numberOfEdges)
    }
    
    override func perimeter() {
        let perimeter = self.edgeLength.0 + self.edgeLength.1 + self.edgeLength.2
        print("Chu vi hình tam giác là: \(perimeter)")
    }
    
    override func acreage() {
        let temp: Double = (self.edgeLength.0 + self.edgeLength.1 + self.edgeLength.2) / 2
        let temp2 = (temp - self.edgeLength.0) * (temp - self.edgeLength.1) * (temp - self.edgeLength.2) * temp
        let acreage = sqrt(temp2)
        print("Diện tích hình tam giác là: \(acreage)")
    }
}

var triangle: Triangles = Triangles(name: "Tam Giác", numberOfEdges: 3, edgeLength: (3,4,5))
triangle.printInfo()
triangle.perimeter()
triangle.acreage()

final class Globulars: ThreeDimensionalGeometry {
    var radius: Double
    
    init(name: String, numberOfEdges: Int, radius: Double) {
        self.radius = radius
        super.init(name: name, numberOfEdges: numberOfEdges)
    }
    
    override func acreage() {
        let acreage = 4 * 3.14 * pow(self.radius, 2)
        print("Diện tích hình cầu là: \(acreage)")
    }
    
    override func volume() {
        let volume = 4 / 3 * 3.14 * pow(self.radius, 3)
        print("Thể tích hình cầu là: \(volume)")
    }
}

var globular: Globulars = Globulars(name: "Hình Cầu", numberOfEdges: 1, radius: 2)
globular.printInfo()
globular.acreage()
globular.volume()

final class Cylinders: ThreeDimensionalGeometry {
    var radius: Double
    var height: Double
    
    init(name: String, numberOfEdges: Int, radius: Double, height: Double) {
        self.radius =  radius
        self.height = height
        super.init(name: name, numberOfEdges: numberOfEdges)
    }
    
    override func acreage() {
        let lateralArea = 2 * 3.14 * self.radius * self.height
        let totalArea = 2 * 3.14 * self.radius * (self.radius + self.height)
        print("Diện tích xung quanh hình trụ là: \(lateralArea)")
        print("Diện tích toàn phần hình trụ là: \(totalArea)")
    }
    
    override func volume() {
        let volume = 3.14 * pow(self.radius, 2) * self.height
        print("Thể tích hình trụ là: \(volume)")
    }
}

var cylinder: Cylinders = Cylinders(name: "Hình Trụ", numberOfEdges: 2, radius: 4, height: 8)
cylinder.printInfo()
cylinder.acreage()
cylinder.volume()
