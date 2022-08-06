import Foundation


//프로그래머스 https://school.programmers.co.kr/learn/courses/30/lessons/12918?language=swift

/*문제 설명

문자열 s의 길이가 4 혹은 6이고, 숫자로만 구성돼있는지 확인해주는 함수, solution을 완성하세요. 예를 들어 s가 "a234"이면 False를 리턴하고 "1234"라면 True를 리턴하면 됩니다.
제한 사항
s는 길이 1 이상, 길이 8 이하인 문자열입니다.
s는 영문 알파벳 대소문자 또는 0부터 9까지 숫자로 이루어져 있습니다.
입출력 예
s    return
"a234"    false
"1234"    true

*/

func solution(_ s : String) -> Bool{

    let str = s
    var startingNumber = 0
    var endingNumber = 0
    var checkLength : Bool = false
    
    if(str.count == 4 || str.count == 6){
        checkLength = true
    }
    

    for i in 0..<str.count{
        startingNumber = i
        endingNumber = i+1
        let startIndex = str.index(str.startIndex, offsetBy: startingNumber)// 사용자지정 시작인덱스
        let endIndex = str.index(str.startIndex, offsetBy: endingNumber)// 사용자지정 끝인덱스
        let slice_str = str[startIndex ..< endIndex]
        let number: Int = Int(Unicode.Scalar(String(slice_str))!.value)
       // print("slice[i]의 값은 \(slice_str) 이고 unicode의 값은 \(number)입니다")
        if(number >= 65 || checkLength == false){
            return false
        }
    }
    return true
}

//func solution(_ s:String) -> Bool {
//return (Int(s) != nil && (s.count == 4 || s.count == 6)) ? true : false
//}. <- 프로그래머스.다른사람의풀이

var returnValue: Bool = solution("0030")
print(returnValue)







