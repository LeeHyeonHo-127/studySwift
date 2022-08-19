

//백준 1316
/*
 그룹 단어 체커
 
 문제
 그룹 단어란 단어에 존재하는 모든 문자에 대해서, 각 문자가 연속해서 나타나는 경우만을 말한다. 예를 들면, ccazzzzbb는 c, a, z, b가 모두 연속해서 나타나고, kin도 k, i, n이 연속해서 나타나기 때문에 그룹 단어이지만, aabbbccb는 b가 떨어져서 나타나기 때문에 그룹 단어가 아니다.

 단어 N개를 입력으로 받아 그룹 단어의 개수를 출력하는 프로그램을 작성하시오.

 입력
 첫째 줄에 단어의 개수 N이 들어온다. N은 100보다 작거나 같은 자연수이다. 둘째 줄부터 N개의 줄에 단어가 들어온다. 단어는 알파벳 소문자로만 되어있고 중복되지 않으며, 길이는 최대 100이다.

 출력
 첫째 줄에 그룹 단어의 개수를 출력한다.

 */

import Foundation

var N = Int(readLine()!)!
var count: Int = 0

for _ in 0..<N {
    var word = readLine()!.map{String($0)}
    var alphabet: [Int] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    var check = 0
    
    for i in 0..<word.count{
        let alphabetIndex = Int(Unicode.Scalar(word[i])!.value) - 97 //alphabet 순서에 맞는 index 로 변환
        
        if(alphabet[alphabetIndex] == 0){ // 지금 word[i] 의 알파벳이 처음 보는 알파벳일 경우
            alphabet[alphabetIndex] = 1
        }
        else if( (i>0) && (word[i] == word[i-1])){ //지금 word[i] 의 알파벳이 연속해서 나오는 경우
            alphabet[alphabetIndex] = 1
        }
        else if((i>0) && (word[i] != word[i-1]) && (alphabet[alphabetIndex] == 1)){ //지금 word[i] 의 알파벳이 0 ~ wor[i-2] 에 있는경우
            check = 1
        }
    }
    if check == 0 {
        count += 1
    }
}

print(count)
