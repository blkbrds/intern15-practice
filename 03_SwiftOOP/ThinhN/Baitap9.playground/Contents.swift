import UIKit

class Mang1c{
    var soNguyen: [Int]
    
    init (soNguyen: [Int]){
        self.soNguyen = soNguyen
    }
    
    func inMang()->String {
        return " Ham co \(soNguyen) "
    }
    func soLonNhat()-> Int {
        var soLonNhat = soNguyen[0]
        for i in 0..<soNguyen.count  {
            if soLonNhat < soNguyen[i]{
                soLonNhat = soNguyen[i]
            }
        }
        print("So lon nhat trong mang la: \(soLonNhat)")
        return soLonNhat
    }
     
    func soNhoNhat()->Int {
        var soNhoNhat = soNguyen[0]
        for i in 0..<soNguyen.count {
            if soNhoNhat < soNguyen[i]{
                soNhoNhat = soNguyen[i]
            }
        }
        print ("so nho nhat trong mang la: \(soNhoNhat) ")
        return soNhoNhat
    }
}
var nhap = Mang1c(soNguyen: [4,5,6,7,8])
print(nhap.inMang())
nhap.soLonNhat()
nhap.soNhoNhat()
