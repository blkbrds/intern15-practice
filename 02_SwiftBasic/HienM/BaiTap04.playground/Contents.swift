import UIKit

//bai tap 4 : tinh chuoi Fibonaci
func chuoiFibonaci (i: Int) {
	var n1 = 0
	var n2 = 1
	var n3 = n1 + n2
	var i = i - 2
	var ketq: Int = 0

	while i > 0 {
		print("\(n3)")
		n1 = n2
		n2 = n3
		n3 = n1 + n2
		i = i - 1
		ketq = ketq + n3
	}
	print("tong fibonacci là : \(ketq)")
}
chuoiFibonaci(i: 10)

// tinh sin cos theo chuoi taylor

func sinX(x: Float) -> Float {
	var S: Float = 0
	let X: Float = x * Float.pi / 180
	var bienTam: Float = X
	var i: Float = 3
	while abs(bienTam) >= 0.0000001 {
		S += bienTam
		bienTam = bienTam * (-(X * X / (i * (i - 1))))
		i = i + 2
	}
	return S
}
func cosX(x: Float) -> Float {
	var c: Float = 0
	let f: Float = x * Float.pi / 180
	var bienTam: Float = f
	var i: Float = 3
	while abs(bienTam) >= 0.0000001 {
		c += bienTam
		bienTam = bienTam * (-1) * (f * f) / (i * (i + 1))
		i = i + 2
	}
	return c
}


//so hanh phuc la gi ;



func sohanhphuc() {
	var tong: Int = 0
	for i in 3..<50 {
		for j in 1..<i - 1 {
			if i % j == 0 {
				tong = tong + j
			}
			if tong == i {
				print("\(i) là số hạnh phúc ")
			}
			tong = 0
		}
	}
}
sohanhphuc()

