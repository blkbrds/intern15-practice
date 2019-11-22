import UIKit

final class CStack<Element> {
    fileprivate var stack: [Element] = []


    func kiemTraRongCStack() -> Bool {
        return self.stack.isEmpty
    }

    func kiemTraDayCStack(soPhanTuToiDaStack: Int) -> Bool {
        return self.stack.count >= soPhanTuToiDaStack - 1 ? true : false
    }

    func push(phanTuMoi: Element) {
        return stack.append(phanTuMoi)
    }

    func pop() -> Element? {
        return stack.popLast()
    }

    func count() -> Int {
        return stack.count
    }
}

var cstack = CStack<Int>()

print("Kiem tra stack rong? \(cstack.kiemTraRongCStack())")

print("Them phan tu vao stack")
cstack.push(phanTuMoi: 5)
cstack.push(phanTuMoi: 2)
cstack.push(phanTuMoi: 6)
cstack.push(phanTuMoi: 2)
cstack.push(phanTuMoi: 50)
cstack.push(phanTuMoi: 59)
cstack.push(phanTuMoi: 35)
cstack.push(phanTuMoi: 500)
cstack.push(phanTuMoi: 54589)

print("Sau khi them, so phan tu stack la: \(cstack.count())")

print("Xoa phan tu trong stack")
cstack.pop()
cstack.pop()
cstack.pop()

print("Sau khi xoa, so phan tu stack la: \(cstack.count())")

print("Kiem tra stack rong? \(cstack.kiemTraRongCStack())")
print("Kiem tra stack day? \(cstack.kiemTraDayCStack(soPhanTuToiDaStack: 10))")
