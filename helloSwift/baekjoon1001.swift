import Foundation

let arr = readLine()!.split(separator: " ").map{Int(String($0))!}
let a = arr[0]
let b = arr[1]

print(a-b)
