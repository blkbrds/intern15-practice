import UIKit

class appPitago {
    var soChuoi : Int
    var nhapMang :[(Int,Int,Int)]

    init(soChuoi: Int ,nhapMang: [(Int,Int,Int)] ) {
        self.soChuoi = soChuoi
        self.nhapMang = nhapMang

    }
    func PytaGo (cacCanh:(Int,Int,Int)) -> Bool{
        let a = cacCanh.0
        let b = cacCanh.1
        let c = cacCanh.2
        if  (a * a) + ( b * b) == (c * c) ||
            (a * a) + ( c * c) == (b * b) ||
            (c * c) + ( b * b) == (a * a)   {
        return true
        }
        return false
    }
    func inPytago() {
    var i = 0
    while i<self.soChuoi {
        if PytaGo(cacCanh: self.nhapMang[i]){
            print(self.nhapMang[i])
            }
            i += 1
        }
    }
}
var nhap = appPitago.init(soChuoi: 5, nhapMang: [(2,3,4),(3,4,5),(3,5,8),(7,24,25),(9,40,41)])
nhap.inPytago()


