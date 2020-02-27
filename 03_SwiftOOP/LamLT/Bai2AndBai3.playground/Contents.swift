import UIKit

class Polygons {
    var n: Int = 3
    var arr = [Int]()

    init(arr: [Int]) {
        self.arr = arr
    }
    init(n: Int, arr: [Int]) {
        self.n = n
        self.arr = arr
    }

    func edge(p: Polygons) {
        let a = p.n
        let x = p.arr
        if x.count < a {
            print("can't print")
        } else {
            for index in 0..<x.count {
                print(x[index])
            }
        }
    }

    func perimeter(p: Polygons) -> Float {
        let y = p.arr
        var per: Float = 0
        for i in 0..<y.count {
            per = per + Float(y[i])
        }
        print(per)
        return per
    }
}

let pol1 = Polygons(n: 5, arr: [1, 6, 3, 2, 6])
pol1.edge(p: pol1)
pol1.perimeter(p: pol1)

let pol2 = Polygons(arr: [1, 6, 3])
pol1.edge(p: pol2)
pol1.perimeter(p: pol2)

class triganle: Polygons {

}

let tri1 = triganle(arr: [4, 5, 7])
tri1.edge(p: tri1)
tri1.perimeter(p: tri1)
