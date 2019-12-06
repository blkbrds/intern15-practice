import UIKit

class CStack<Element> {
    fileprivate var array: [Element] = []
    
    func isEmpty() -> Bool {
        return self.array.isEmpty
    }
    
    func isFull(numberOfElements: Int) -> Bool {
        return self.array.count >= numberOfElements - 1 ? true : false
    }
    
    func push(element: Element) {
        return self.array.append(element)
    }
    
    func pop() -> Element? {
        return self.array.popLast()
    }
    
    func count() -> Int {
        return array.count
    }
}

var cstack = CStack<Int>()
print("Is this stack empty? \(cstack.isEmpty())")
print("Add elements to this stack. ")
cstack.push(element: 23)
cstack.push(element: 14)
cstack.push(element: 5)
print("The number of elements after adding: \(cstack.count())")
print("Remove the elements of this stack. ")
cstack.pop()
print("The number of elements after removing: \(cstack.count())")
print("Add elements to this stack. ")
cstack.push(element: 12)
cstack.push(element: 67)
print("The number of elements after adding: \(cstack.count())")
print("Is this stack empty? \(cstack.isEmpty())")
