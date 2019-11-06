import UIKit

func hinhCau(banKinh: Double) -> (dienTich: Double, theTich: Double){
    let theTich = 4 * .pi * banKinh * banKinh * banKinh / 3
    let dienTich = 4 * .pi * banKinh * banKinh
    return (round(theTich), round(dienTich))
}

let hinhA = hinhCau(banKinh: 5)
print("""
    Hình cầu bán kính 5
    có diện tích bằng \(hinhA.dienTich)
    và thể tích bằng \(hinhA.theTich)
""")
