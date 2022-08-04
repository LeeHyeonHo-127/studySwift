import Foundation

//백준 1110

/*0보다 크거나 같고, 99보다 작거나 같은 정수가 주어질 때 다음과 같은 연산을 할 수 있다. 먼저 주어진 수가 10보다 작다면 앞에 0을 붙여 두 자리 수로 만들고, 각 자리의 숫자를 더한다. 그 다음, 주어진 수의 가장 오른쪽 자리 수와 앞에서 구한 합의 가장 오른쪽 자리 수를 이어 붙이면 새로운 수를 만들 수 있다. 다음 예를 보자.

26부터 시작한다. 2+6 = 8이다. 새로운 수는 68이다. 6+8 = 14이다. 새로운 수는 84이다. 8+4 = 12이다. 새로운 수는 42이다. 4+2 = 6이다. 새로운 수는 26이다.

위의 예는 4번만에 원래 수로 돌아올 수 있다. 따라서 26의 사이클의 길이는 4이다.

N이 주어졌을 때, N의 사이클의 길이를 구하는 프로그램을 작성하시오.
*/

var input = Int(readLine()!)!
var firstInput : Int = input

var arr : [Int] = [0,0]
var arr2 : [Int] = [0,0]
var temp : Int
var result : Int = -1
var resultTemp : String
var resultInt : Int

var cycleCount : Int = 0



while(result != firstInput)
{
    if(input >= 10){
        arr[1] = input % 10
        input = input - arr[1]
        arr[0] = (input % 100) / 10 // arr[0] - 10의 자릿 수 ,arr[1] - 1 의 자릿수
    }

    else{
        arr[0] = 0
        arr[1] = input
    }
    //print("arr[0] = \(arr[0]), arr[1] = \(arr[1])")

    temp = arr[0] + arr[1]
    //print("temp = \(temp)")

    if(temp >= 10){
        arr2[1] = temp % 10
        temp = temp - arr2[1]
        arr2[0] = (temp % 100) / 10 // arr[0] - 10의 자릿 수 ,arr[1] - 1 의 자릿수
    }

    else{
        arr2[0] = 0
        arr2[1] = temp
    }
    //print("arr2[0] = \(arr2[0]), arr2[1] = \(arr2[1])")


    result = Int(String(arr[1]) + String(arr2[1]))!
    cycleCount += 1
    input = result

    //print(result)
}

print(cycleCount)






