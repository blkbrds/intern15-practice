import UIKit

final class TestPitago {
    var n: Int
    var triangles: [(Int,Int,Int)]
    
    init(n: Int, triangles: [(Int,Int,Int)]) {
        self.n = n
        self.triangles = triangles
    }
    
    func pitago(triangle: (Int,Int,Int)) -> Bool {
        let edge1 = triangle.0
        let edge2 = triangle.1
        let edge3 = triangle.2
            if edge1 * edge1==(edge2 * edge2 + edge3 * edge3) || edge2 * edge2==(edge1 * edge1 + edge3 * edge3) || edge3 * edge3==(edge1 * edge1 + edge2 * edge2) {
                return true
            } else {
                return false
        }
    }
    
    func printTriangle() {
        var i = 0
        while i<self.n {
            if pitago(triangle: self.triangles[i]) {
                print(self.triangles[i])
            }
            i += 1
        }
    }
}

var testpitago: TestPitago = TestPitago(n: 4, triangles: [(1,2,3),(3,4,5),(4,5,6),(8,6,10)])
testpitago.printTriangle()
