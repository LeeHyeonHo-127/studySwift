import Foundation


//인스턴스 생성및 소멸 11.1.7

class Person {
    let name: String
    var age: Int?
    
    init?(name: String){
        
        if name.isEmpty {
            return nil
        }
        self.name = name
    }
}

var person: Person? = Person(name: "")
print(person) //nil


//인스턴스 생성및 소멸 11.2

class FileManager{
    var fileName: String
    
    init(fileName: String){
        self.fileName = fileName
    }
    
    func openFile(){
        print("Open FIle: \(self.fileName)")
    }
    
    func modifyFile(){
        print("Modify FIle: \(self.fileName)")
    }
    
    func writeFile(){
        print("Write FIle: \(self.fileName)")
    }
    
    func closeFile(){
        print("close FIle: \(self.fileName)")
    }
    
    deinit{
        print("Deinit instance")
        self.writeFile()
        self.closeFile()
    }
}

var fileManager : FileManager? = FileManager(fileName: "abc.txt")

if let manager: FileManager = fileManager{ //nil 이 아닐 떄 동작
    manager.openFile() //Open FIle: abc.txt
    manager.modifyFile() //Modify FIle: abc.txt
}

fileManager = nil
// Deinit instance
// Write FIle: abc.txt
//close FIle: abc.txt

