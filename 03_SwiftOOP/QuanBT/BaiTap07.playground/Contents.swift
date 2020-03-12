import UIKit

final class Students {
    var fullName: String
    var yearOfBirth: Int
    var totalScore: Int
    
    init(fullName: String, yearOfBirth: Int, totalScore: Int) {
        self.fullName = fullName
        self.yearOfBirth = yearOfBirth
        self.totalScore = totalScore
    }
    
    func nameFormat() {
        self.fullName = self.fullName.capitalized
    }
    
    func toString() -> String {
        return "Họ và tên: \(fullName), năm sinh: \(yearOfBirth), tổng điểm: \(totalScore)"
    }
}

final class StudentArrangements {
    var n: Int
    var arr: [Students]
    
    init(n: Int, arr:[Students]) {
        self.n  = n
        self.arr = arr
    }
    
    func sort() {
        var temp: Students
        for item in 0..<self.n-1 {
            for i in item+1..<self.n {
                if self.arr[i].totalScore>self.arr[item].totalScore {
                    temp = self.arr[item]
                    self.arr[item] = self.arr[i]
                    self.arr[i] = temp
                } else if self.arr[item].totalScore==self.arr[i].totalScore {
                    if self.arr[item].yearOfBirth>self.arr[i].yearOfBirth {
                        temp = self.arr[item]
                        self.arr[item] = self.arr[i]
                        self.arr[i] = temp
                    }
                }
            }
        }
    }
    
    func printStudens() {
        for item in 0..<self.n {
            self.arr[item].nameFormat()
            print(self.arr[item].toString())
        }
    }
}

var students: StudentArrangements = StudentArrangements(n: 5, arr: [Students(fullName: "bùi thiện quân", yearOfBirth: 1998, totalScore: 100), Students(fullName: "phạm đức anh", yearOfBirth: 1997, totalScore: 90), Students(fullName: "trần văn cường", yearOfBirth: 1996, totalScore: 90), Students(fullName: "phạm đình nhã", yearOfBirth: 1997, totalScore: 95), Students(fullName: "nguyễn hữu hưng", yearOfBirth: 1997, totalScore: 80)])
students.sort()
students.printStudens()
