import UIKit

func hinhCau(bankinh: Double) -> (dthc: Double, tthc: Double){
    let dthc: Double = (4 * Double.pi * bankinh * bankinh).rounded()
    let tthc: Double = ((4 / 3) * Double.pi * bankinh * bankinh * bankinh).rounded()
    return (dthc,tthc)
}
let r = hinhCau(bankinh: 8)
print("dien tich hinh cau la: ", r.dthc)
print("the tich hinh cau la: ", r.tthc)
