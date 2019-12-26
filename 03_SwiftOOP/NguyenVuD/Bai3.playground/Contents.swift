import Foundation
class daGiac {
    var soCanh: Int
    var mangCanh: [Int]
    
    init(soCanh: Int, mangCanh: [Int]) {
        self.soCanh = soCanh
        self.mangCanh = mangCanh
    }
    
    func tinhChuVi () -> Int  {
        var cv = 0
        for i in 0..<soCanh {
            cv += mangCanh[i]
        }
        return cv
    }
    
    func inGiaTriCacCanh () -> [String: Int]{
        var giaTriCacCanh = [String: Int]()
        for i in 0..<soCanh {
            giaTriCacCanh["Cạnh thứ \(i+1)"] = mangCanh[i]
        }
        return giaTriCacCanh
    }
}
class tamGiac : daGiac {
    var a: Int
    var b: Int
    var c: Int
    
    init (mangCanh: [Int]){
        a = mangCanh[0]
        b = mangCanh[1]
        c = mangCanh[2]
        super.init(soCanh: 3, mangCanh: mangCanh)
    }
    
    override func tinhChuVi() -> Int {
        return mangCanh[0] + mangCanh[1] + mangCanh[2]
    }
    
    func tinhDienTich () -> Float {
        let p = tinhChuVi() / 2
        let s = p * (p - a) * (p - b) * (p - c)
        return (sqrt(Float(s)))
    }
}

var tamgiacA = tamGiac(mangCanh: [10,9,3])
print(tamgiacA.tinhChuVi())
print(tamgiacA.tinhDienTich())

