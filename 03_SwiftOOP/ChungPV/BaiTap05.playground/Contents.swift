//import UIKit

struct CStack{
    var mang: [Int]
    var size: Int
    
    init(size: Int, mang : [Int]) {
        self.size = size
        self.mang = mang
    }
    func isemptyStack() -> Bool{
        if mang.isEmpty{
            return true
        } else {
            return false
        }
    }
    func isFullStack() -> Bool {
        if mang.count == size {
            return true
        } else {
            return false
        }
    }
    func statusStack(){
        if isemptyStack() == true {
            print("Stack nay rong!")
        } else {
            print("Stack nay day!")
        }
    }
    mutating func push(item: Int){
        if isFullStack() == true {
            print("Full stack roi nha, khong the them")
        } else {
            mang.append(item)
        }
    }
    mutating func pop() {
        if isemptyStack() == true {
            print ("Mang rong , khong xoa duoc nha")
        } else{
            mang.removeLast()
        }
    }
    
}
var stack = CStack(size: 11, mang: [1,2,3,4,5,6,7,8,9,10])

// kiem tra stack rong hay khong
stack.statusStack()

// add 1 phan tu vao dau
stack.push(item: 11)
print("Stack sau khi them 1 phan tu la: \(stack.mang)")

// Xoa 1 phan tu
stack.pop()
print("Stack sau khi xoa la: \(stack.mang)")
stack.pop()


