import Foundation

func tinhDienTichVaTheTichHinhCau(bankinh: Float) -> (dientich: Float, thetich: Float) {
    let pi: Float = 3.14
    let dientich = 4 * pi * bankinh * bankinh
    let thetich = 4 / 3 * pi * bankinh * bankinh * bankinh
    return (dientich, thetich)
}
//print(tinhDienTichVaTheTichHinhCau(bankinh: 3))

func tinhPhuongTrinhBac2(a: Float, b:Float, c:Float) -> (x1: Float, x2: Float) {
    var x1: Float!
    var x2: Float!
    if a == 0 {
        if b == 0 {
            if c == 0 {
                print("phương trình vô số nghiệm !")
            } else {
                print("phương trình vô nghiệm !")
            }
        } else {
            x1 = -c / b
            x2 = 0.0
        }
    } else {
        let delta = b * b - 4 * a * c
        if delta < 0 {
            print("Phương trình vô nghiệm")
        }
        if delta == 0 {
            x1 = -b / (2 * a)
            x2 = -b / (2 * a)
        }
        if delta > 0 {
            x1 = ( -b + sqrt(delta)) / ( 2 * a )
            x2 = ( -b - sqrt(delta)) / ( 2 * a )
        }
    }
    return (x1, x2)
}
//print(tinhPhuongTrinhBac2(a: 0,b: 3,c: 1))

func tinhHePhuongTrinhBac1(a1: Float, b1: Float, c1:Float, a2: Float, b2: Float, c2:Float) -> (x: Float, y: Float) {
    let d: Float = a1 * b2 - a2 * b1
    let dX: Float = c1 * b2 - c2 * b1
    let dY: Float = a1 * c2 - a2 * c1
    var x: Float = 0
    var y: Float = 0
    if d == 0 {
        if dX + dY == 0 {
            print("He phuong trinh co vo so nghiem")
        } else {
            print("He phuong trinh vo nghiem");
        }
    } else {
        x = dX / d;
        y = dY / d;
    }
    return(x,y)
}
//print(tinhHePhuongTrinhBac1(a1: 2.0, b1: 3.0, c1: 5.0, a2: 4.0, b2: 6.0, c2: 10.0))

func tinh100SoFibonacy(so: Int) -> Int {
    var a1: Int = 0
    var a2: Int = 1
    var a3: Int = 0
    var tong: Int = 1
    switch so {
    case 0:
        tong = 0
        break
    case 1:
        tong = 1
        break
    default:
        for _ in 2...so {
            a3 = a1 + a2
            a1 = a2
            a2 = a3
            tong += a3
        }
    }
    return tong
}
//print(tinh100SoFibonacy(so: 90))

func tim100SoFibonacyDauTien(so: Int) -> [Int] {
    var mang = [Int]()
    var a1: Int = 1
    var a2: Int = 1
    var a3: Int = 0
    var j: Int = 0
    for i in 1...so{
        if ( i == 1 || i == 2) {
            mang.insert(1, at: j)
            j += 1
        } else {
            a3 = a1 + a2
            a1 = a2
            a2 = a3
            mang.insert(a3, at: j)
            j += 1
        }
    }
    return mang
}
//print(tim100SoFibonacyDauTien(so: 90))

func giaithua(x: Int) -> Int {
    var tich: Int  = 1
    for i in 1...x {
        tich *= i
    }
    return tich
}

func timSinXCosX(goc: Float) -> (sinx: Float, cosx: Float) {
    let saiso: Float = 0.000001
    var sinx: Float = 0.0
    var cosx: Float = 0.0
    var n = 0
    var tinh: Float = 1.0
    let rad = goc * .pi / 180
    while tinh > saiso {
        tinh = pow(rad, Float(2 * n + 1)) / Float(giaithua(x: 2 * n + 1))
        if n % 2 == 0 {
            sinx += tinh
        } else {
            sinx -= tinh
        }
        n += 1
    }
    cosx = sqrt(1 - pow(sinx, 2))
    return (sinx, cosx)
}
let temp = timSinXCosX(goc: 40.0)
//print(temp)

func tongBinhPhuongMoiSo(so: Int) -> Int { // Tong binh phuong tung so trong mot so
    var soTam = so
    var tong = 0
    var phanDu = 0
    while soTam > 0 {
        phanDu = soTam % 10
        tong += phanDu * phanDu
        soTam = soTam / 10
    }
    return tong
}

func ktSoHanhPhuc(so: Int) -> Bool {
    if so == 1 {
        return true
    }
    var hanhPhuc = so
    var mangTam: [Int] = []
    while hanhPhuc > 1 && !mangTam.contains(hanhPhuc) {
        mangTam.append(hanhPhuc)
        hanhPhuc = tongBinhPhuongMoiSo(so: hanhPhuc)
    }
    
    return hanhPhuc == 1
}

func lietKeSoHanhPhuc(n: Int) -> [Int] {
    var mangHanhPhuc: [Int] = []
    for i in 0..<n {
        if ktSoHanhPhuc(so: i) {
            mangHanhPhuc.append(i)
        }
    }
    return mangHanhPhuc
}

//print("\nLiet ke so hanh phuc nho hon 100: \(lietKeSoHanhPhuc(n: 1000))")

func soChuoiCon(chuoiMe: String, chuoiCon: String) -> Int {
    var count = 0
    let mangA: [Character] = Array(chuoiMe)
    let mangB: [Character] = Array(chuoiCon)
    for i in 0...mangA.count - mangB.count {
        if [Character](mangA[i..<i + mangB.count]) == mangB {
            count += 1
        }
    }
    return count
}
//print(soChuoiCon(chuoiMe: "abababbbbababbabbbbab", chuoiCon: "bba"))

func DaoMang(mangBanDau: [Int]) -> [Int] {
    var mangA: [Int] = mangBanDau
    mangA.shuffle()
    return mangA
}
//print(daoMang(mangBanDau: [1,2,3,4,5,6,7,8,9]))

func thayThePhanTuCuaMang(inputArray: [Int], elemToReplace: Int, substitutionElem: Int) -> [Int] {
    var mangA: [Int] = inputArray
    for i in 0...inputArray.count - 1 {
        if (inputArray[i] == elemToReplace){
            mangA.remove(at: i)
            mangA.insert(substitutionElem, at: i)
        }
    }
    return mangA
}
print(thayThePhanTuCuaMang(inputArray: [1,2,2,1,1,2,3,4,1,2,1], elemToReplace: 1, substitutionElem: 3))
