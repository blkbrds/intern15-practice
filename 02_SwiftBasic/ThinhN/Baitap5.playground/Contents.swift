import UIKit

func soLanLap(chuoiCon:String,chuoiMe:String) ->Int{
    var soLan:Int = 0
    let mangCon: [Character] = Array (chuoiCon)
    let mangMe:[Character] =  Array (chuoiMe)
    for i in 0...mangCon.count - mangMe.count {
        if [Character](mangCon[i..<(i + mangMe.count)]) == mangMe
        { soLan = soLan + 1 }
    }
    return soLan
}
soLanLap(chuoiCon: "abaababababbab", chuoiMe: "ab")
