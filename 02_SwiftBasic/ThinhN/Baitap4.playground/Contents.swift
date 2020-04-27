import UIKit

func ktraFiboes(i: Int) ->[Int]{
    var fiboes: [Int] =  []
    var soThuNhat: Int = 0
    var soThuHai: Int = 1
    var fibonacci: Int
    fiboes.append(soThuNhat)
    fiboes.append(soThuHai)
    for _ in 0..<i {
        fibonacci = soThuNhat + soThuHai
        soThuNhat = soThuHai
        soThuHai = fibonacci
        fiboes.append(fibonacci)
    }
    return fiboes
}
ktraFiboes(i: 10)
func tongFibo(i: Int) -> Int {
    let mangMoi: [Int] = ktraFiboes(i: i)
    var tong: Int = 0
    for i in 0..<mangMoi.count {
        tong += mangMoi[i]
    }
    return tong
}
tongFibo(i: 5)
func tongBinhPhuongCuaMotSo(soBanDau: Int) -> Int {
    var soTam: Int = 0
    var soBinhPhuong: Int = soBanDau
    while soBinhPhuong != 0 {
        soTam = (soBinhPhuong % 10) * (soBinhPhuong % 10)
        soBinhPhuong = soBinhPhuong / 10
    }
    return soTam
}
func kiemTraSoHanhPhuc(soCanKiemTra: Int) -> Bool {
    if soCanKiemTra == 1 {
        return true
    }
    var soNhapVao: Int = soCanKiemTra
    var mangTam:[Int] = []
    while soNhapVao > 1 && !mangTam.contains(soNhapVao) {
        mangTam.append(soNhapVao)
        soNhapVao = tongBinhPhuongCuaMotSo(soBanDau: soNhapVao)
    }
    return soNhapVao == 1
}
func lietKeSoHanhPhuc() {
    for i in 1...50 {
        if kiemTraSoHanhPhuc(soCanKiemTra: i) == true {
            print(i)
        }
    }
}
lietKeSoHanhPhuc()

