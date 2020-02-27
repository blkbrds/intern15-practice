import UIKit

final class Student {
    var name: String
    var birthDay: Int
    var point: Double

    init(name: String, birthDay: Int, point: Double) {
        self.name = name.flowerfirstWord()
        self.birthDay = birthDay
        self.point = point
    }

    func toString() -> String {
        return "Name Student : \(name),\t Birth Day: \(birthDay),\t Point: \(point)"
    }
}

extension String {
    func flowerfirstWord() -> String {
        let name: String = self
        var listStudentArr: [Character] = Array(name)
        listStudentArr[0] = Character(listStudentArr[0].uppercased())
        for i in 1..<listStudentArr.count where listStudentArr[i - 1] == " " {
            listStudentArr[i] = Character(listStudentArr[i].uppercased())
        }

        return String(listStudentArr)
    }
}

extension Array where Element: Student {
    func sortListStudent() -> [Student] {
        var listStudent: [Student] = self

        listStudent.sort { (student1, student2) -> Bool in
            if student1.point == student2.point {
                return student1.birthDay < student2.birthDay
            } else {
                return student1.point > student2.point
            }
        }

        return listStudent
    }

    func printListStudent() {
        let listSt: [Student] = self
        for i in 0..<listSt.count {
            print(listSt[i].toString())
        }
    }
}

var listStudent: [Student] = []

listStudent.append(Student(name: "An", birthDay: 1999, point: 7.5))
listStudent.append(Student(name: "Binh", birthDay: 2000, point: 8.9))
listStudent.append(Student(name: "Jeanne", birthDay: 1988, point: 5.6))
listStudent.append(Student(name: "Dao", birthDay: 990, point: 5.2))


print("List Before Sort")
listStudent.printListStudent()

print("\nList After Sort")
var listStudentAfterSort = listStudent.sortListStudent()
listStudentAfterSort.printListStudent()
