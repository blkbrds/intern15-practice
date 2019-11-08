import UIKit

func hinhCau(bankinh: Double) -> (Double, Double) {
    let dienTich = (4 * .pi * bankinh * bankinh).rounded()
    let theTich = (4 / 3 * (.pi * bankinh * bankinh * bankinh)).rounded()
    return (theTich, dienTich)
}
print("Diện tích là: \(hinhCau(bankinh: 3).0)")
