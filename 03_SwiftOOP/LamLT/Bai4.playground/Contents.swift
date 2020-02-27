import UIKit

class TriganlePitago {
    var triganle = [Int]()

    init(triganle: [Int]) {
        self.triganle = triganle
    }

    func maxNumberArray(a: [Int]) -> Int {
        let n = a
        var max = n[0]
        for i in 0..<n.count {
            if max < n[i] {
                max = n[i]
            }
        }
        return max
    }

    func checkTriganle(t: TriganlePitago) -> [Int] {
        var m = t.triganle
        var sum: Int = 0
        let n = maxNumberArray(a: m)
        for i in 0..<m.count {
            if m[i] < n {
                sum = sum + m[i] * m[i]
            }
        }
        print(sum)
        print(n)
        if sum == n * n {
            print("Triganle \(m) is Pitago")
        } else {
            print("Triganle \(m) is Not Pitago")
            m = []
        }
        return m
    }
}
let tri1 = TriganlePitago(triganle: [5,4,2])
let q = tri1.checkTriganle(t: tri1)
print(q)
