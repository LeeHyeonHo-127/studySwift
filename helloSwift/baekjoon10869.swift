import Foundation

var input = readLine()!.split(separator: " ").map{Int(String($0))!}
let a = input[0]
let b = input[1]

print("\(a+b) \n\(a-b) \n\(a*b) \n\(a/b) \n\(a%b) \n ")
