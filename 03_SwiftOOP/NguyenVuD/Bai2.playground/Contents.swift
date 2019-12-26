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

var dagiacA = daGiac(soCanh: 3, mangCanh: [1,2,3])
print(dagiacA.tinhChuVi())
print(dagiacA.inGiaTriCacCanh())
