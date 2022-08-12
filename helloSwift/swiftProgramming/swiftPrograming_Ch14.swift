import Foundation


//MARK: - 14-1-1 옵셔널 체이닝 사용

class Room {
    var number: Int
    
    init(number: Int){
        self.number = number
    }
}

class Building {
    var name: String
    var room: Room?
    
    init(name: String){
        self.name = name
    }
}

struct Address{
    var province: String
    var city: String
    var street: String
    var building: Building?
    var detailAddress: String?
}

class Person{
    var name: String
    var address: Address?
    
    init(name: String){
        self.name = name
    }
}

let hyunho: Person = Person(name: "HyunHo")

//MARK: - 14-1-5 옵셔널 체이닝 사용2


let hyunhoRoomViaOptionalChaining: Int? = hyunho.address?.building?.room?.number
print(hyunhoRoomViaOptionalChaining)

if let roomNumber: Int = hyunho.address?.building?.room?.number{
    print(roomNumber)
} else {
    print("Can not find room number")
}

print()

//MARK: - 14-1-6 옵셔널 체이닝을 통한 값 할당

hyunho.address = Address(province: "경상북도", city: "포항시", street: "유강길")
hyunho.address?.building = Building(name: "대림")
hyunho.address?.building?.room = Room(number: 3)
hyunho.address?.building?.room?.number = 127
print(hyunho.address?.building?.room?.number) // Optional(127)

 

//MARK: - 14-2-1 (14-11) guard 구문의 옵셔널 바인딩 사용

func greet(_ person: [String: String]){
    guard let name: String = person["name"] else{
        return
    }
    
    print("hello \(name)")
    
    guard let location: String = person["location"] else{
        print("I hope the weather is nice near you")
        return
    }
    
    print("I hope the weather is nice in \(location)")
}


var personInfo: [String: String] = [String: String]()
personInfo["name"] = "HyunHo"
personInfo["location"] = "Korea"

greet(personInfo)
//hello HyunHo
//I hope the weather is nice in Korea



