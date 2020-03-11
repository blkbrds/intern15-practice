import UIKit

func areaAndVolume(radius: Double) -> (Double, Double){
    let pi: Double = 3.14159
    let acreage: Double = 4 / 3 * pi * pow(radius, 3)
    let volume: Double = 4 * pi * pow(radius, 2)
    return (acreage, volume)
}
print(areaAndVolume(radius: 3))

