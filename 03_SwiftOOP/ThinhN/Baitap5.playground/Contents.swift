import UIKit

class CStack {
    var soStack :Int
    var Stack : [Int]
    
    init(themStack :Int, Stack: [Int]){
    self.soStack = themStack
    self.Stack = Stack
    }
    
    func emptyStack(){
        if self.Stack.count == 0{
        print ( " Stack rỗng")
        } else {
            print("Stack có chứa giá trị")
        }
    }
        
    func fullStack(){
        if self.Stack.count == soStack {
            print(" Stack full")
        } else {
            print("Stack chưa đầy ")
        }
    }
    func addStack(){
        self.Stack.append(soStack)
            print(" Da them 1 stack")
        
        }
}

    
