import UIKit

func hinhcau(bankinh: Double) {

    let dienTich = (4 * .pi * bankinh * bankinh).rounded()
    let theTich = (4 / 3 * (.pi * bankinh * bankinh * bankinh)).rounded()
    print("Dien tich la", dienTich)
    print("The tich la", theTich)
}
hinhcau(bankinh: 2)
