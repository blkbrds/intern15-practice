import UIKit

func hinhcau(bankinh: Double) -> (Double, Double) {

    let dienTich = (4 * .pi * bankinh * bankinh).rounded()
    let theTich = (4 / 3 * (.pi * bankinh * bankinh * bankinh)).rounded()
    return (theTich, dienTich)
    
}
print("Diện tích là: \(hinhcau(bankinh: 3).0)")
