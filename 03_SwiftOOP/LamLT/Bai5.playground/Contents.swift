import UIKit

class CStack {
    var items: [Int] = []

    init(items: [Int]) {
        self.items = items
    }

    func checkNullStack(instaneCStack: CStack) -> String {
        var txt: String = ""
        var dem: Int = 0
        let instaneArrayItem = instaneCStack.items
        if instaneArrayItem.count == 0 {
            txt = "This Stack is Empty"
        }
        else {
            for i in 0..<instaneArrayItem.count {
                if instaneArrayItem[i] == nil {
                    dem += 1
                }
            }
            if dem == instaneArrayItem.count {
                txt = "This Stack Is Empty"
            } else {
                txt = "This Stack Is  Not Empty"
            }

        }
        return txt
    }

    func checkFullStack(instaneCStack: CStack) -> String {
        var txt: String = ""
        var dem: Int = 0
        let instaneArrayItem = instaneCStack.items
        if instaneArrayItem.count == 0 {
            txt = "This Stack is Empty"
        }
        else {
            for i in 0..<instaneArrayItem.count {
                if instaneArrayItem[i] != nil {
                    dem += 1
                }
            }
            if dem == instaneArrayItem.count {
                txt = "This Stack Is Full"
            } else {
                txt = "This Stack Is  Not Full"
            }
        }
        return txt
    }
    
    func pushvalue(instaneCStack: CStack, n: Int) -> [Int] {
        var instaneArrayItem = instaneCStack.items
        instaneArrayItem.append(n)
        return instaneArrayItem
    }

    func popTop(instaneCStack: CStack) -> [Int] {
        var instaneArrayItem = instaneCStack.items
        instaneArrayItem.popLast()
        return instaneArrayItem
    }
}

let x = CStack(items: [4,5,1])

let t = x.checkNullStack(instaneCStack: x)
print(t)

let b = x.checkFullStack(instaneCStack: x)
print(b)

let a = x.pushvalue(instaneCStack: x, n: 4)
print(a)

x.items = a

let c = x.popTop(instaneCStack: x)
print(c)
