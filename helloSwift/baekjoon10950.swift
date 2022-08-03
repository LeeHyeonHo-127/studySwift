import Foundation

//백준 10950

//두 정수 A와 B를 입력받은 다음, A+B를 출력하는 프로그램을 작성하시오.

//입력

//첫째 줄에 테스트 케이스의 개수 T가 주어진다.
//각 테스트 케이스는 한 줄로 이루어져 있으며, 각 줄에 A와 B가 주어진다. (0 < A, B < 10)

//출력

//각 테스트 케이스마다 A+B를 출력한다.


var n : Int = Int(readLine()!)!
var input : [Int] = [0,0]
var output : [Int] = Array<Int>()
var temp : Int

for _ in 0..<n
{
    input = readLine()!.split(separator: " ").map{Int(String($0))!}
    output.append(input[0] + input[1])
}

for i in 0..<n
{
    
    print(output[i])
}

