import Foundation

//MARK: 22-2 프로토콜과 제네릭을 이용한 전위 연산자 구현

prefix operator **

prefix func ** <T: BinaryInteger> (value: T) -> T {
    return value * value
}


//MARK: 22-6 제네릭을 사용한 swapTwoValue(_:_:) 함수

func swapTwoValues<T>(_ a: inout T, _ b: inout T){
    let temp: T = a
    a = b
    b = temp
}

var numberOne: Int = 1
var numberTwo: Int = 2

swapTwoValues(&numberOne, &numberTwo)
print("\(numberOne) \(numberTwo)") //2, 1


//MARK: 22-8 제네릭을 사용한 Stack 구조체 타입

struct Stack<Element> {
    var items = [Element]()
    mutating func push(_ item: Element){
        items.append(item)
    }
    mutating func pop() -> Element{
        return items.removeLast()
    }
}

var doubleStack: Stack<Double> = Stack<Double>()

doubleStack.push(1.0)
print(doubleStack.pop()) //1.0

//MARK: 22-9 익스텐션을 통한 제네릭 타입의 기능 추가

extension Stack{
    var topElement: Element? {
        return self.items.last
    }
}

//MARK: 22-10

//public struct Dictionary<Key : Hashable, Value>: Collection, ExpressibleByDictionaryLiteral{
    //..
//}


//MARK: 22-16 연관 타입을 사용하여 protocol 정의

protocol Container{
    associatedtype ItemType //연관 타입 생성
    var count: Int {get}
    mutating func append( _ item: ItemType)
    subscript(i:Int) -> ItemType{get}
}
