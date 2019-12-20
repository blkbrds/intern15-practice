import UIKit

func hinhCau(banKinh : Double ) -> (dienTich : Double ,chuVi : Double){
	let pi : Double = 3.14
	let dienTich : Double = 4 * banKinh * pi
	let chuVi : Double = 3/4 * banKinh * pi
	return ( dienTich,chuVi )
}
hinhCau(banKinh: 3)
