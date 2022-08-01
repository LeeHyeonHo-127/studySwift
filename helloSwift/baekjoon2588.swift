import Foundation

//백준 2588
//(세 자리 수) × (세 자리 수)는 다음과 같은 과정을 통하여 이루어진다.
//(1)과 (2)위치에 들어갈 세 자리 자연수가 주어질 때 (3), (4), (5), (6)위치에 들어갈 값을 구하는 프로그램을 작성하시오.


var input1 : Int = Int(readLine()!)!
var input2 : Int = Int(readLine()!)!
var temp : Int
var result = input1 * input2 // (6)

for _ in 0...2 //(3,4,5)
{
    temp = input2 % 10
    print(input1 * temp)
    input2 = (input2 - temp) / 10
}

print(result)
