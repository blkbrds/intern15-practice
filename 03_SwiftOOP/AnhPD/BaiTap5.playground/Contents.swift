import UIKit

class CStack {
    var n: Int
    var stack: [Int]
    init(n: Int,stack: [Int]) {
        self.n = n
        if n > stack.count {
            self.stack = stack
        } else {
            self.stack = Array(stack[0..<n])
        }
    }
    func kTraRong() -> Bool {
        if stack.count == 0{
            return true
        } else {
            return false
        }
    }
    func kTraStackDaDayChua() {
        if stack.count < n {
            print("Stack của bạn chưa đầy")
        } else {
            print("Stack của bạn đã đầy")
        }
    }
    func themPhanTu(a: Int) {
        if stack.count < n {
            stack.append(a)
            print("Bạn thêm thành công ",stack)
        } else {
            print("Stack của bạn đã đầy")
        }
    }
    func xoaPhanTuODinh() {
        if stack.count != 0 {
            stack.popLast()
            print("Bạn đã xoá phần tử ở đỉnh ",stack)
        } else {
            print("Ngăn xếp rỗng")
        }
    }
}
var st = CStack(n: 10, stack: [1,2,3])
print(st.kTraRong())
st.kTraStackDaDayChua()
st.themPhanTu(a: 4)
st.xoaPhanTuODinh()


