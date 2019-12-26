class A {
    var n: Int
    
    init(n: Int) {
        self.n = n
    }
    
    func tong() -> Int {
        var s: Int = 0
        for i in 1...n {
            s = s + i
        }
        return s
    }
}

var tinh = A(n: 100)
print(tinh.tong())
