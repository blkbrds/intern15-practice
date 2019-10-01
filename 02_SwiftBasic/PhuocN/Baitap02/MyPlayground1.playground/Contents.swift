import UIKit

enum PTKetQua {
  case pt1(Float)
  case pt2(Float, Float)
  case vn(Bool)
  case vsn(String)
}

func ptb2(a: Float, b: Float, c: Float) -> PTKetQua {
  if a == 0 {
    if b == 0 {
      if c == 0 {
        return PTKetQua.vsn("Pt vo so nghiem")
      }
      return PTKetQua.vn(false)
    }
    return PTKetQua.pt1(-c/b)
  }
  let delta = b*b - 4*a*c
  if delta >= 0 {
    return PTKetQua.pt2((-b-sqrt(delta)) / (2*a), (-b+sqrt(delta)) / (2*a))
    }
  return PTKetQua.vn(false)
}

func ptb12an(a1: Float, b1: Float, c1: Float,a2: Float, b2: Float, c2: Float) -> PTKetQua {
  let A = b1*a2 - b2*c1
  let C = c1*a2 - c2*a1
  let B = c2*b1 - c1*b2
  
  if A == 0 {
    if B == 0 {
      return PTKetQua.vsn("Pt vo so nghiem")
    }
    return PTKetQua.vn(false)
  }
  return PTKetQua.pt2(B/A, C/A)
}

let temp = ptb12an(a1: 1, b1: 1, c1: 1, a2: 1, b2: 1, c2: 0)
switch temp {
case .pt1(let x):
  print(x)
case .pt2(let x1, let x2):
  print("x1: \(x1),x2: \(x2)")
case .vn(let error):
  print(error)
case .vsn(let msg):
  print(msg)
}



