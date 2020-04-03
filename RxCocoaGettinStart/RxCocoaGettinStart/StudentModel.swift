//
//  StudentModel.swift
//  RxCocoaGettinStart
//
//  Created by Felipe Petersen on 02/04/20.
//  Copyright © 2020 Felipe Petersen. All rights reserved.
//

import Foundation
import RxSwift

struct Student {
    let name: String
    let tia: String
    let age: String
}

class StudentController: NSObject {
    
    static let shared: StudentController = StudentController()
    var students = [Student]()
    
    override init() {
        super.init()
        mockStudents()
    }
    
    func getStudentsObjects() -> Observable<[Student]> {
        return Observable.of(students)
    }
    
    func mockStudents() {
        let st = Student(name: "felipe", tia: "123", age: "22")
        let st2 = Student(name: "Eloisa", tia: "1234", age: "20")
        let st3 = Student(name: "Enes", tia: "12345", age: "21")
        let st4 = Student(name: "joao", tia: "123456", age: "20")
        self.students.append(st)
        self.students.append(st2)
        self.students.append(st3)
        self.students.append(st4)
    }
    
    func getStudent(named: String) -> Observable<Student> {
        return Observable.just(students.first(where: { (student) -> Bool in
            student.name == named
        }) ?? Student(name: "Sem nome", tia: "Sem tia", age: "Sem idade"))
    }
  
}
