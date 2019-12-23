import UIKit

var mang = [1,2,1]

func replaceMang(array: [Int],a: Int, b: Int) -> [Int] {
    var c:[Int] = array
    for i in 0...c.count - 1{
        if c[i] == a{
            c.remove(at: i)
            c.insert(b, at: i)
        }
    }
    return c
}
replaceMang(array: mang, a: 1, b: 3)
