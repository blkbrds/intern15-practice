import UIKit

func chuoiMeCon(chuoiMe: String, chuoiCon: String) -> Int {
	let arrayA: [Character] = Array(chuoiMe)
	let arrayB: [Character] = Array(chuoiCon)
	var tong = 0
	for i in 0...arrayA.count - arrayB.count {
		if [Character](arrayA[i..<i + arrayB.count]) == arrayB {
			tong = tong + 1
		}
	}
	return 0
}
chuoiMeCon(chuoiMe: "sdsfdsfsdsfs", chuoiCon: "sd")
