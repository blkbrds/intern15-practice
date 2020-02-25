import UIKit

func hinhCau(banKinh: Double) -> (dienTich: Double, theTich: Double) {
    let dienTich = 4 * .pi * banKinh * banKinh
    let theTich = (4 / 3) * .pi * banKinh * banKinh * banKinh
    return (dienTich, theTich)
}

let hinhA = hinhCau(banKinh: 5)
print("Hinh A co dien tich: \(hinhA.dienTich) va the tich: \(hinhA.theTich)")
