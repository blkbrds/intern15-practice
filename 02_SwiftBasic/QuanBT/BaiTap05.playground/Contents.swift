import UIKit

func findString(_ string: String,_ substring: String ) -> Int{
    let x =  Array(string)
    let y = Array(substring)
    var n = 0, i = 0, m = 0, t = 0
    while n < x.count {
        i = n
        var d = 0
        while m < y.count {
            if(y[m] == x[i]){
                d += 1
            }
            m += 1
            i += 1
            if( d == y.count){
                t += 1
            }
        }
        if (n < x.count - y.count) {
            m = 0
        }
        n += 1
    }
    return t
}
print(findString("abababaabaaabababaaab","ab"))
