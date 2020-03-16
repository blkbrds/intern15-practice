import UIKit

class CStack{
    var mangSoNguyen :[Int]
    var soStack :Int
    init(soStack:Int, mangSoNguyen :[Int]){
        self.mangSoNguyen = mangSoNguyen
        self.soStack = soStack
        if self.soStack < self.mangSoNguyen.count{
            print (" Stack khong hop le ")
        }
    }
    
    func emptyStack(){
        if self.mangSoNguyen.isEmpty{
            print(" Stack rong")
        }else{
            print("Stack co chua gia tri")
        }
    }
    
    func fullStack(){
        if mangSoNguyen.count == soStack {
            print (" Stack day gia tri ")
        }else{
            print ("Stack khong day gia tri")
        }
    }
    
   func addStack(them: Int){
    if mangSoNguyen.count == soStack {
        print (" khong the them stack duoc")
    }else{
        mangSoNguyen.append(them)
    }
    }
    func delStack(){
        if mangSoNguyen.count == 0{
          print("khong the xoa them ")
        }else{
         self.mangSoNguyen.removeLast()
   }
}
}
var mangStack = CStack.init(soStack: 5,mangSoNguyen:[1,3,4,7,5])

mangStack.emptyStack()
mangStack.fullStack()
print(mangStack.mangSoNguyen)
mangStack.addStack(them: 7)
print(mangStack.mangSoNguyen)
mangStack.addStack(them: 8)
print(mangStack.mangSoNguyen)
mangStack.addStack(them: 12)
print(mangStack.mangSoNguyen)
mangStack.delStack()
print(mangStack.mangSoNguyen)
