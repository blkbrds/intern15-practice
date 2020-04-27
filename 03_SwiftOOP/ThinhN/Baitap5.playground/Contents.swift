import UIKit

class buildStack{
    var mangSoNguyen: [Int]
    var soStack: Int
    init(soStack: Int, mangSoNguyen: [Int]){
        self.mangSoNguyen = mangSoNguyen
        self.soStack = soStack
        if self.soStack < self.mangSoNguyen.count{
            print ("Stack khong hop le ")
        }
    }
    
    func isEmptyStack(){
        if self.mangSoNguyen.isEmpty{
            print("Stack rong")
        }else{
            print("Stack co chua gia tri")
        }
    }
    
    func isFullStack(){
        if mangSoNguyen.count == soStack {
            print ("Stack day gia tri ")
        }else{
            print ("Stack khong day gia tri")
        }
    }
    
   func push(element: Int){
    if mangSoNguyen.count == soStack {
        print ("Khong the them stack duoc")
    }else{
        mangSoNguyen.append(element)
        }
    }
    func pop(){
        if mangSoNguyen.count == 0{
          print("Khong the xoa them ")
        }else{
         self.mangSoNguyen.removeLast()
        }
    }
}
var mangStack = buildStack(soStack: 5,mangSoNguyen: [1,3,4,7,5])

mangStack.isEmptyStack()
mangStack.isFullStack()
print(mangStack.mangSoNguyen)
mangStack.push(element: 7)
print(mangStack.mangSoNguyen)
mangStack.push(element: 8)
print(mangStack.mangSoNguyen)
mangStack.push(element: 12)
print(mangStack.mangSoNguyen)
mangStack.pop()
print(mangStack.mangSoNguyen)
