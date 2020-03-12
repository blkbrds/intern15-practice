import UIKit

final class CStack {
    var stack: [Int]
    var numberOfElements: Int
    
    init(stack: [Int], numberOfElements: Int) {
        self.stack = stack
        self.numberOfElements = numberOfElements
    }
    
    func emptyTest() {
        if self.stack.count==0 {
            print("Stack của bạn rỗng")
        } else {
            print("Stack của bạn không rỗng")
        }
    }
    
    func fullTest() {
        if self.numberOfElements==self.stack.count {
            print("Stack của bạn đã đầy")
        } else {
            print("Stack của bạn chưa đầy")
        }
    }
    
    func addElement(additionalElement: Int) {
        if self.numberOfElements>self.stack.count {
            self.stack.append(additionalElement)
        } else {
            fullTest()
        }
    }
    
    func deleteElement() {
        if self.stack.count>0 {
            self.stack.remove(at: self.stack.count - 1)
        } else {
            print("Stack đã hết phần tử để xoá")
        }
    }
}

var stack: CStack = CStack(stack: [1,2,3], numberOfElements: 10)
stack.emptyTest()
stack.fullTest()
stack.addElement(additionalElement: 4)
print(stack.stack)
stack.deleteElement()
print(stack.stack)
