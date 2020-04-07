import Foundation

final class Data {
    var number: Int
    
    init(number: Int) {
        self.number = number
    }
}

extension Data {
    static func getDummyDatas() -> [Data] {
        var datas: [Data] = []
        for i in 1...150 {
            let data = Data(number: i)
            datas.append(data)
        }
        return datas
    }
}
