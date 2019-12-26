import Foundation
 class timTamgiacPitago {
    var n: Int
    var mangTamGiac: [(Int, Int, Int)]
    
    init(n: Int, mangTamGiac: [(Int, Int, Int)]) {
        self.n = n
        self.mangTamGiac = mangTamGiac
    }
    
    func ktPitago(tamgiac: (Int, Int, Int)) -> Bool {
        let a = Double(tamgiac.0)
        let b = Double(tamgiac.1)
        let c = Double(tamgiac.2)
        
        if a * a + b * b == c * c || a * a + c * c == b * b || b * b + c * c == c * c
        {
            return true
        }
        else{
        return false
        }
    }
    func duyetTamgiac()->[(Int, Int, Int)]{
        var duyetTamgiac = [(Int, Int, Int)]()
        for i in 0..<mangTamGiac.count {
            if ktPitago(tamgiac: mangTamGiac[i]) == true{
           
                duyetTamgiac.append(mangTamGiac[i])
            }
        }
        return duyetTamgiac
    }
}
var tamgiac = timTamgiacPitago(n: 3, mangTamGiac: [(3,4,5), (1,2,3), (4,5,3),(5,6,9),(5,12,13)])

print	("Cac tam giac thoa man pitago la: \(tamgiac.duyetTamgiac())")
