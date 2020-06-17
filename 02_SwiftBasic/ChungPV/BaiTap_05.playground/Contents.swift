import Foundation

func countSubstring(mstring: String, substring: String) -> Int{
    let sub = mstring.components(separatedBy: substring)
    return sub.count - 1
}
countSubstring(mstring: "xin chao moi nguoi", substring: "i")
