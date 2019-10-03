import UIKit

func hinhCau(bankinh: Double)->(dthc : Double , tthc :Double){
  let dthc : Double = (4 * Double.pi * bankinh * bankinh).rounded()
  let tthc : Double = (4/3 * Double.pi * bankinh * bankinh * bankinh).rounded()
  return (dthc,tthc)
}
let bien = hinhCau(bankinh:6)
  print("diện tích hình cầu là đây : " , bien.dthc)
  print("thể tích hình cầu là  đây :",bien.tthc)

