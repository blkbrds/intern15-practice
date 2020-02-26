import UIKit

class Globular {
    func createGlobular(radius: Double) -> (Double, Double) {
        let area: Double = 4 * .pi * radius * radius
        let volume: Double = 4 / 3 * .pi * pow(radius, 3)
        print("\(Int(area)), \(Int(volume))")
        return (area, volume)
    }
}

let x = Globular()
x.createGlobular(radius: 4)
