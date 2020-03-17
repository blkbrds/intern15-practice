import UIKit

class CStack {
    var stack : [Int]
    var phantu: Int
    
    init(stack: [Int], phantu: Int) {
        if stack.count > phantu {
            self.stack = Array(stack[0..<phantu])
        } else {
            self.stack = stack
        }
        self.phantu = phantu
    }
    //ktra ngan xep rong
    func isEmpty() {
        if self.stack.count == 0 {
            print("Stack rỗng")
        } else {
            print("Stack không rỗng")
        }
    }
    
    func isFull() {
        if self.phantu <= self.stack.count {
            print("Stack đã đầy")
        } else {
            print("Stack chưa đầy")
        }
    }
    
    func themPhanTu(_ phantu: Int) {
        if self.phantu > self.stack.count {
            self.stack.append(phantu)
        } else {
            isFull()
        }
    }
    
    func xoaPhanTu() {
        if self.stack.count > 0 {
            self.stack.removeLast()
        } else {
            print("Stack không có phần tử để xoá")
        }
    }
}

var st = CStack(stack: [1,2,3,6,9], phantu:10)
st.isEmpty()
st.isFull()
st.themPhanTu(4)
print(st.stack)
st.xoaPhanTu()
print(st.stack)

