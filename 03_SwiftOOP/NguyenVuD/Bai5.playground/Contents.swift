class CStack<Element> {
    fileprivate var stack: [Element] = []
    
    func isEmpty() -> Bool {
        return stack.isEmpty
    }
    
    func isFull(maxIndex: Int) -> Bool {
        if(stack.count >= maxIndex - 1) {
            return true
        } else {
            return false
        }
    }
    
    func push(phantumoi: Element){
        stack.append(phantumoi)
    }
    
    func pop() -> Element? {
        return stack.popLast()
    }
}
var stack = CStack<Int>()

stack.push(phantumoi: 1)
stack.push(phantumoi: 2)
stack.push(phantumoi: 3)
stack.push(phantumoi: 4)
stack.push(phantumoi: 5)

print("Danh sách rỗng ? \(stack.isEmpty())")
print("Danh sách đầy ? \(stack.isFull(maxIndex: 7))")

stack.pop()
stack.pop()

