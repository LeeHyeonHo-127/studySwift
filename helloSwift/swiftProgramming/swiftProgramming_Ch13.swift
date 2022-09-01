
//MARK: 13.3 정렬을 위한 함수 전달
import Foundation

let names: [String] = ["HyeonHo", "HaeIn", "YangSub","NamGue"]

func backwards(first: String, second: String) -> Bool{
    return first > second
}

let reverse: [String] = names.sorted(by: backwards)
print(reverse)//["YangSub", "NamGue", "HyeonHo", "HaeIn"]


//MARK: 13.4 메서드에 클로저 전달

let reverse2: [String] = names.sorted(by:{ (first: String, second: String)-> Bool in return first > second})
print(reverse2) //["YangSub", "NamGue", "HyeonHo", "HaeIn"]


//MARK: 13.4 후행 클로저

let reversed: [String] = names.sorted(){(first: String, second: String)-> Bool in return first > second}
print(reversed)

//다중클로저 각 클로저를 중괄호로 묶어 후행으로 여러개를 적어줄 수 있다.
/*
doSomething{(someStrinng: String)
    in ...
} onSuccess {(result: Any) in
        ..
}*/


//MARK: 13.6 반환 타입 유추
let reversed2: [String] = names.sorted{(first: String, second: String)in return first > second}
print(reversed2) //["YangSub", "NamGue", "HyeonHo", "HaeIn"]


//MARK: 13.7 단축 인자 이름 사용
let reversed3: [String] = names.sorted{return $0 > $1}
print(reversed3) //["YangSub", "NamGue", "HyeonHo", "HaeIn"]


//MARK: 13.8 암시적 반환 표현( return 생략 )
let reversed4: [String] = names.sorted{ $0 > $1}
print(reversed4) //["YangSub", "NamGue", "HyeonHo", "HaeIn"]

//MARK: 13.9 연산자 함수 ( ">" 자체가 하나의 함수이다)
let reversed5: [String] = names.sorted(by: >)
print(reversed5) //["YangSub", "NamGue", "HyeonHo", "HaeIn"]


//MARK: 13.16 탈출 클로저를 매개변수로 갖는 함수

var completionHandlers: [() -> Void] = []

func someFUnctionWithEscapingClosure(completionHandler: @escaping ()-> Void) {
    completionHandlers.append(completionHandler)
}
