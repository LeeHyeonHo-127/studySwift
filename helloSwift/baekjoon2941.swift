

//백준 2941
/*
 문제
 예전에는 운영체제에서 크로아티아 알파벳을 입력할 수가 없었다. 따라서, 다음과 같이 크로아티아 알파벳을 변경해서 입력했다.

 크로아티아 알파벳    변경
 č    c=
 ć    c-
 dž    dz=
 đ    d-
 lj    lj
 nj    nj
 š    s=
 ž    z=
 예를 들어, ljes=njak은 크로아티아 알파벳 6개(lj, e, š, nj, a, k)로 이루어져 있다. 단어가 주어졌을 때, 몇 개의 크로아티아 알파벳으로 이루어져 있는지 출력한다.

 dž는 무조건 하나의 알파벳으로 쓰이고, d와 ž가 분리된 것으로 보지 않는다. lj와 nj도 마찬가지이다. 위 목록에 없는 알파벳은 한 글자씩 센다.

 입력
 첫째 줄에 최대 100글자의 단어가 주어진다. 알파벳 소문자와 '-', '='로만 이루어져 있다.

 단어는 크로아티아 알파벳으로 이루어져 있다. 문제 설명의 표에 나와있는 알파벳은 변경된 형태로 입력된다.

 출력
 입력으로 주어진 단어가 몇 개의 크로아티아 알파벳으로 이루어져 있는지 출력한다.


 */

import Foundation

let arr = readLine()!.map{String($0)} //단어 입력받고 각 알파벳 문자열로 이루어진 배열 생성
var count = arr.count
var temp:Int = 0
for i in 1..<arr.count{ //여러개로 세어진 크로아티아 알파벳을 확인하고 갯수 조절
    switch arr[i]{
    case "-":
        if(arr[i-1] == "c"){
            count -= 1
        }
        else if(arr[i-1] == "d"){
            count -= 1
        }
    case "=":
        if(i > 1 && arr[i-2] == "d" && arr[i-1] == "z"){
            count -= 2
        }
        else if(arr[i-1]) == "z"{
            count -= 1
        }
        else if(arr[i-1] == "c"){
            count -= 1
        }
        else if(arr[i-1] == "s"){
            count -= 1
        }
    case "j":
        if(arr[i-1]) == "l"{
            count -= 1
        }
        else if(arr[i-1] == "n"){
            count -= 1
        }
    default:
        temp += 1
    }
}

print(count)

