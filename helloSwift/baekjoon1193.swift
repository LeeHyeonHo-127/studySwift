//백준 1193 분수찾기
/*
 문제
 무한히 큰 배열에 다음과 같이 분수들이 적혀있다.

 1/1    1/2    1/3    1/4    1/5    …
 2/1    2/2    2/3    2/4    …    …
 3/1    3/2    3/3    …    …    …
 4/1    4/2    …    …    …    …
 5/1    …    …    …    …    …
 …    …    …    …    …    …
 이와 같이 나열된 분수들을 1/1 → 1/2 → 2/1 → 3/1 → 2/2 → … 과 같은 지그재그 순서로 차례대로 1번, 2번, 3번, 4번, 5번, … 분수라고 하자.

 X가 주어졌을 때, X번째 분수를 구하는 프로그램을 작성하시오.

 입력
 첫째 줄에 X(1 ≤ X ≤ 10,000,000)가 주어진다.

 출력
 첫째 줄에 분수를 출력한다.
 */




import Foundation


//MARK: 변수 설정
var N = Int(readLine()!)!
var mother = 0
var son = 0
var total = 0
var beforeTotal = 0
var cycle = 1


//MARK: 입력받은 숫자가 몇 번쨰 사이클인지, 사이클 내에서 몇 번쨰에 위치했는지 파악
while(true){
    if(total < N){
        beforeTotal = total
        total += cycle
        cycle += 1
    }else{
        cycle -= 1
        break
    }
}

N = N - beforeTotal-1

//MARK: 입력받은 숫자의 사이클이 짝수인지 홀수인지 파악 후 규칙에 맞게 값 설정
if(cycle%2 == 0){
    son = 1 + N
    mother = cycle - N
}else{
    son = cycle - N
    mother = 1 + N
}

print("\(son)/\(mother)")
