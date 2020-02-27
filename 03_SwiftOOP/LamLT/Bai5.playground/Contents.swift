import UIKit

class CStack {
    var item: [Int] = []

    init(item: [Int]) {
        self.item = item
    }

    func checkNullStack(f: CStack) -> String {
        var txt: String = ""
        var dem: Int = 0
        var g = f.item
        if g.count == 0 {
            txt = "This Stack is Empty"
        }
        else {
            for i in 0..<g.count {
                if g[i] == nil {
                    dem += 1
                }
            }
            if dem == g.count {
                txt = "This Stack Is Empty"
            } else {
                txt = "This Stack Is  Not Empty"
            }

        }
        return txt
    }


    func checkFullStack(f: CStack) -> String {
        var txt: String = ""
        var dem: Int = 0
        let g = f.item
        if g.count == 0 {
            txt = "This Stack is Empty"
        }
        else {
            for i in 0..<g.count {
                if g[i] != nil {
                    dem += 1
                }
            }
            if dem == g.count {
                txt = "This Stack Is Full"
            } else {
                txt = "This Stack Is  Not Full"
            }
        }
        return txt
    }
    func pushvalue(f: CStack, n: Int) -> [Int] {
        var g = f.item
        g.append(n)
        return g
    }

    func popTop(f: CStack) -> [Int] {
        var g = f.item
        g.popLast()
        return g
    }
}

let x = CStack(item: [4,5,1])

let t = x.checkNullStack(f: x)
print(t)

let b = x.checkFullStack(f: x)
print(b)

let a = x.pushvalue(f: x, n: 4)
print(a)

x.item = a

let c = x.popTop(f: x)
print(c)
