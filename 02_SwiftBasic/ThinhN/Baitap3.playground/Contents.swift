import UIKit

var str = "Hello, playground"
enum cacNghiem {
    case voNghiem
    case voSoNghiem
    case haiNghiem(x :Float,y : Float)
}
func giaiHePT ( a1: Float, a2: Float , b1: Float, b2: Float, c1: Float, c2: Float ) -> cacNghiem {
    let D  = a1*b2 - a2*b1
    let Dx = c1*b2 - c2*b1
    let Dy = a1*c2 - a2*c1
    if D == 0
     {  if Dx + Dy == 0
        {return .voSoNghiem}
        else
        {return .voNghiem}
       }
    else  {
        return .haiNghiem (x : Dx / D, y: Dy / D )
        }
}
giaiHePT(a1: 3, a2: -3, b1: 4, b2: -2, c1: 3, c2:3)
