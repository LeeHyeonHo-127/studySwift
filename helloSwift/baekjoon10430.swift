import Foundation

var input = readLine()!.split(separator: " ").map{Int(String($0))!}
var A = input[0]
var B = input[1]
var C = input[2]
print("\((A+B)%C)")
print("\(((A%C) + (B%C))%C)")
print("\((A*B)%C)")
print("\(((A%C) * (B%C))%C)")
