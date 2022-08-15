import Foundation


//MARK: - 17-3 서브스크립트 구현

struct Student{
    var name: String
    var number: Int
}

class School{
    var number: Int = 0
    var students: [Student] = [Student]()
    
    func addStudent(name: String) {
        let student: Student = Student(name: name, number: self.number)
        self.students.append(student)
        self.number += 1
    }
    
    func addStudents(names: String...){
        for name in names{
            self.addStudent(name: name)
        }
    }
    subscript(index: Int = 0) -> Student?{
        if index < self.number{
            return self.students[index]
        }
        return nil
    }
}


let highSchool: School = School()
highSchool.addStudent(name: "HyunHo")

let aStudent: Student? = highSchool[0]
print("\(aStudent?.number), \(aStudent?.name)")
