import Foundation

//MARK: 18-4 메서드 재정의

class Person{
    var name: String = ""
    var age: Int = 0
    
    var introduction: String{
        return "이름 : \(name), 나이 :\(age)"
    }
    
    func speak(){
        print("SPEAK. SPEAK.")
    }
    
    class func introduceClass() -> String{
        return "제 소원은 네이버 취업 입니다"
    }
}

class Student: Person{
    var grade: String = "A+"
    
    func study(){
        print("Study hard...")
    }
    
    override func speak(){
        print("저는 학생 입니다.")
    }
}

class UniversityStudent: Student {
    var major: String = ""
    
    class func introduceClass(){ //상속이 가능한 타입 메서드
        print(super.introduceClass())
    }
    
    override class func introduceClass() -> String {
        return "대학생의 소원은 취업입니다."
    }
    
    override func speak(){
        super.speak()
        print("대학생 이죠")
    }
}

let hyunho: Person = Person()
hyunho.speak() //SPEAK SPEAK

let HaeIn: Student = Student()
HaeIn.speak()//저는 학생입니다.

let Bumsoo: UniversityStudent = UniversityStudent()
Bumsoo.speak()//저는 학생 입니다.
//대학생 이죠

print(Person.introduceClass()) //제 소원은 네이버 취업 입니다
print(Student.introduceClass()) //제 소원은 네이버 취업 입니다
print(UniversityStudent.introduceClass() as String) //반환 타입 = String
//대학생의 소원은 취업입니다.
UniversityStudent.introduceClass() as Void //반환타입 = Void
//제 소원은 네이버 취업 입니다




//MARK: 18-10 클래스 이니셜라이저의 재정의

class Person1{
    var name: String
    var age: Int
    
    init(name: String, age: Int){
        self.name = name
        self.age = age
    }
    
    convenience init(name: String){
        self.init(name: name, age: 0)
    }
}

class Student1: Person1 {
    var major: String
    
    override init(name: String, age: Int){ //지정 이니셜라이저는 재정의 할 때 override를 붙인다.
        self.major = "Swift"
        super.init(name: name, age: age)
    }
    
    convenience init(name: String){ //편의 이니셜라이저는 상속이 안되므로 재정의 하지 않는다.
        self.init(name: name, age: 7)
    }
}



//MARK: 18-12 이니셜라이저 자동상속

class Person2{
    var name: String

    init(name: String){
        self.name = name
    }
    
    convenience init(){
        self.init(name: "Unknown")
    }
}

class Student2: Person2 {
    var major: String = "Swift"
}

print("")
print("---이니셜라이저 자동상속----")
//지정 이니셜라이저 자동 상속
let hyeonho2: Student2 = Student2(name: "hyeonho")
print(hyeonho2.name) //hyeonho

//편의 이니셜라이저 자동 상속
let hoyeon2: Student2 = Student2()
print(hoyeon2.name) //Unknown


//MARK: 18-17 요구 이니셜라이저

class Person3{
    var name: String

    //요구 이니셜라이저 정의
    required init(){
        self.name = "Unkown"
    }
}

class Student3: Person3 {
    var major: String = "Swift"
    
    //자신의 지정 이니셜라이저 정의
    init(major: String){
        self.major = major
        super.init()
    }
    
    required init(){
        self.major = "Unknown"
        super.init()
    }
}

class UniversityStudent3: Student3 {
    var grade: String
    
    //자신의 지정 이니셜라이저 정의
    init(grade: String){
        self.grade = grade
        super.init()
    }
    
    required init(){
        self.grade = "F"
        super.init()
    }
}

print("")
print("---요구 이니셜라이저---")
let hyeonho3: Student3 = Student3()
print(hyeonho3.major) //Unknown

let yagom3: Student3 = Student3(major: "Swift")
print(yagom3.major) //Swift

