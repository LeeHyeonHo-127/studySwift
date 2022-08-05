import Foundation


var number : [Int] = [0,0]
number = readLine()!.split(separator: " ").map{Int(String($0))!}

while(number[0] != 0 && number[1] != 0){
    print("\(number[0] + number[1])")
    number = readLine()!.split(separator: " ").map{Int(String($0))!}
}

