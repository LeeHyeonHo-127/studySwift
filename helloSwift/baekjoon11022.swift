import Foundation

var n : Int = Int(readLine()!)!
var number : [Int] = [0,0]

for i in 1...n{
    number = readLine()!.split(separator: " ").map{Int(String($0))!}
    
    print("Case #\(i): \(number[0]) + \(number[1]) = \(number[0] + number[1])")
}
