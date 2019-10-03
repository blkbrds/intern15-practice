import UIKit

// sap xep danh sach hoc sinh theo thu tu tang dan theo diem va ten. In hoa chu cai cua hoc sinh

extension String {
  func vietHoaChuDau() -> String {
    var temp: [Character] = Array(self)
    guard !temp.isEmpty else { return "" }
    temp[0] = Character(temp[0].uppercased())
    for i in 0..<temp.count - 1 where temp[i] == " " {
      temp[i + 1] = Character(temp[i + 1].uppercased())
    }
    return String(temp)
  }
}

struct Date {
  var day: Int
  var month: Int
  var year: Int
  
  init(day: Int, month: Int, year: Int) {
    self.day = day
    self.year = year
    self.month = month
  }
  
  func normalize() -> Date? {
    guard year < 1 else { return nil }
    guard month < 0 || month > 12 else { return nil }
    guard day < 0 || day > daysIn(in: month) else { return nil }
    return self
  }
  
  func namNhuan(year: Int) -> Bool {
    return year % 400 == 0 || year % 4 == 0 && year % 100 != 0
  }
  
  func daysIn(in month: Int) -> Int {
    switch month {
    case 1,3,5,7,8,10,12:
      return 31
    case 4,6,9,11:
      return 30
    case 2:
      return namNhuan(year: self.year) ? 29 : 28
    default:
      return 31
    }
  }
  
  mutating func advance(day: Int, month: Int, year: Int) {
    guard let _ = Date(day: day, month: month, year: year).normalize() else { return }
    self.day = day
    self.year = year
    self.month
  }
  
  func inNgay() {
    print("\(day)/\(month)/\(year)")
  }
}

class HocSinh {
  var hoTen: String
  let namSinh: Date
  let tongDiem: Float
  
  init(hoTen: String, namSinh: Date, tongDiem: Float) {
    self.hoTen = hoTen.vietHoaChuDau()
    self.namSinh = namSinh
    self.tongDiem = tongDiem
  }
}

extension Array where Element: HocSinh {
  func sapXepDsHocSinh() -> [HocSinh] {
    var dsHocSinh: [HocSinh] = self
    dsHocSinh.sort { (hs1, hs2) -> Bool in
      guard hs1.tongDiem <= hs2.tongDiem else { return false }
      if hs1.tongDiem < hs2.tongDiem {
        return true
      }
      return hs1.hoTen < hs2.hoTen
    }
    return dsHocSinh
  }
}

let danhSach = [HocSinh(hoTen: "nguyen A", namSinh: Date(day: 10, month: 5, year: 1997), tongDiem: 7),
                HocSinh(hoTen: "nguyen B", namSinh: Date(day: 12, month: 6, year: 1997), tongDiem: 8),
                HocSinh(hoTen: "nguyen q", namSinh: Date(day: 10, month: 5, year: 1997), tongDiem: 7),
                HocSinh(hoTen: "le n", namSinh: Date(day: 10, month: 5, year: 1997), tongDiem: 7),
                HocSinh(hoTen: "le m", namSinh: Date(day: 10, month: 5, year: 1997), tongDiem: 7)]
danhSach.sapXepDsHocSinh()
