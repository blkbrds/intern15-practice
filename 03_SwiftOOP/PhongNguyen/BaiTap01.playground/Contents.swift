import Foundation
class PhanSo {
    var tuso: Int
    var mauso: Int
    
    init?(tuso: Int,mauso: Int){
        if mauso == 0{
            return nil
        }
            self.tuso = tuso
            self.mauso = mauso
        
    }
    func cong(PS: PhanSo?)->PhanSo?{
        guard let PS = PS else {return nil}
        let tu = PS.tuso * mauso + PS.mauso * tuso
        let mau = PS.mauso * mauso
        return PhanSo(tuso: tu, mauso: mau)
    }
    
    func tru(PS: PhanSo?)->PhanSo?{
        guard let PS = PS else {return nil}
        let tu = PS.tuso * mauso - PS.mauso * tuso
        let mau = PS.mauso * mauso
        return PhanSo(tuso: tu, mauso: mau)
    }
    func nhan(PS: PhanSo?)->PhanSo?{
        guard let PS = PS else {return nil}
        let tu = PS.tuso *  tuso
        let mau = PS.mauso * mauso
        return PhanSo(tuso: tu, mauso: mau)
    }
    func chia(PS: PhanSo?)->PhanSo?{
        guard let PS = PS else {return nil}
        let tu = PS.tuso *  mauso
        let mau = PS.mauso + tuso
        return PhanSo(tuso: tu, mauso: mau)
    }
    
    func Xuat() {
        print("\(tuso)/\(mauso)")
    }
    
}
let phanSoA = PhanSo(tuso: 5,mauso: 0)
let phanSoB = PhanSo(tuso: 5,mauso: 15)
    let cong = phanSoA?.cong(PS: phanSoB)
    cong?.Xuat()
    let  tru = phanSoA?.tru(PS: phanSoB)
    tru?.Xuat()
    let nhan = phanSoA?.nhan(PS: phanSoB)
    nhan?.Xuat()
    let chia = phanSoA?.chia(PS: phanSoB)
    chia?.Xuat()

