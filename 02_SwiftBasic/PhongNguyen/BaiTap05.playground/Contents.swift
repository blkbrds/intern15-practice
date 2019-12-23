import UIKit

func demChuoi(me: String ,con: String)-> Int{
    var dem: Int = 0
    let A : [Character] = Array(me)
    let B : [Character] = Array(con)
    for i in 0...A.count - B.count {
        if [Character](A[i..<i + B.count]) == B {
            dem += 1
        }
    }
    return dem
}
print(demChuoi(me: "ababababaabababababbabababababababaaabbbababa", con: "aba"))
