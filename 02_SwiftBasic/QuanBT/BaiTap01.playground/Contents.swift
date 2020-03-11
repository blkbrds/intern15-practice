import UIKit

func areaAndVolume(_ r: Double) -> (Double, Double){
    let pi: Double = 3.14159
    let s: Double = 4 / 3 * pi * pow(r, 3)
    let v: Double = 4 * pi * pow(r, 2)
    return (s , v)
}
print(areaAndVolume(3))

