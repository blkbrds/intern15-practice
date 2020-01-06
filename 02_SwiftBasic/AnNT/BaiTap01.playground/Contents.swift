import UIKit

//BaiTap01
func dienTichTheTichHinhCau(r: Float) -> (dienTich: Float, theTich: Float) {
    let dienTich = 4 * Float.pi * r * r
    let theTich = 4 / 3 * Float.pi * r * r * r
    return (dienTich, theTich)
}
dienTichTheTichHinhCau(r: 5.5)
