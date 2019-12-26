class Mang1c {
    var mang: [Int]
    
    init(mang: [Int]) {
        self.mang = mang
    }
    
    func inMang() {
        print(mang)
    }
    
    func inPhanTuLonNhat() -> Int {
        var max: Int = mang[0]
        for i in 1..<mang.count {
            if mang[i] > max {
                max = mang[i]
            }
        }
        return max
    }
    
    func inPhanTuNhoNhat() -> Int {
        var min: Int = mang[0]
        for i in 1..<mang.count {
            if mang[i] < min {
                min = mang[i]
            }
        }
        return min
    }
}

var mangA = Mang1c(mang: [1, 2, 3, 4, 99, 54])
mangA.inMang()
print(mangA.inPhanTuLonNhat())
print(mangA.inPhanTuNhoNhat())
