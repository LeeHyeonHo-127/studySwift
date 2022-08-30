//백준 2869 달팽이는 올라가고 싶다
/*
 문제
 땅 위에 달팽이가 있다. 이 달팽이는 높이가 V미터인 나무 막대를 올라갈 것이다.

 달팽이는 낮에 A미터 올라갈 수 있다. 하지만, 밤에 잠을 자는 동안 B미터 미끄러진다. 또, 정상에 올라간 후에는 미끄러지지 않는다.

 달팽이가 나무 막대를 모두 올라가려면, 며칠이 걸리는지 구하는 프로그램을 작성하시오.

 입력
 첫째 줄에 세 정수 A, B, V가 공백으로 구분되어서 주어진다. (1 ≤ B < A ≤ V ≤ 1,000,000,000)

 출력
 첫째 줄에 달팽이가 나무 막대를 모두 올라가는데 며칠이 걸리는지 출력한다.
 */




import Foundation


var arr = readLine()!.split(separator: " ").map{Int(String($0))!}
var temp = 0
var count = 0
var A = arr[0]
var B = arr[1]
var V = arr[2]

temp = V - A

if(temp == 0){
    count = 0
}else if(temp < (A-B)){
    count = 1
}else{
    if(temp % (A-B) != 0){
        count = (temp/(A-B)) + 1
    }else{
        count = temp/(A-B)
    }
}
count += 1
print(count)
