import UIKit

// Giai  Phuong Trinh Bac 2

func giaiPhuongTrinhBatNhat2An (a1: Int ,a2: Int ,b1: Int ,b2: Int ,c1: Int ,c2: Int ) {
	let  D  :	Int  = a1 * b2 - a2 * b1
	let	 Dx :	Int  = c1 * b2 - c2 * b1
	let  Dy : 	Int  = a1 * c2 - a2 * c1
	if D == 0 {
		if Dx + Dy == 0 {
			print("he phuong trinh co vo so nghiem")
		}
		else {
			print("he phuong trinh vo nghiem")
		}
	}
	else {
		let x : Int = Dx / D
		let y : Int = Dy / D
        print("He phuong trinh co 2 nghiem ")
		print("x= \(x)")
		print("y= \(y)")
	}
}
giaiPhuongTrinhBatNhat2An(a1: 2, a2: 2, b1: 2, b2: 1, c1: 5, c2: 1)
