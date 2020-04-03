//
//  StudentsViewController.swift
//  RxCocoaGettinStart
//
//  Created by Felipe Petersen on 02/04/20.
//  Copyright © 2020 Felipe Petersen. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class StudentViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let bag = DisposeBag()
    let STUDENT_CELL = "StudentTableViewCell"
    let SPECIAL_CELL = "SpecialStudentTableViewCell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    func setupTableView() {
        self.tableView.register(UINib(nibName: STUDENT_CELL, bundle: nil), forCellReuseIdentifier: STUDENT_CELL)
        self.tableView.register(UINib(nibName: SPECIAL_CELL, bundle: nil), forCellReuseIdentifier: SPECIAL_CELL)
        let students = StudentController.shared.getStudentsObjects()
//
//        students
//            .bind(to: tableView
//          .rx
//          .items(cellIdentifier: STUDENT_CELL,
//                 cellType: StudentTableViewCell.self)) {
//                  row, student, cell in
//                    cell.setup(student: student)
//        }.disposed(by: bag)
//
        students
            .bind(to: tableView.rx.items) { (tableView: UITableView, index: Int, element: Student) -> UITableViewCell in
                if index == 0 {
                    let cell = tableView.dequeueReusableCell(withIdentifier: self.SPECIAL_CELL, for: IndexPath(row: index, section: 0)) as! SpecialStudentTableViewCell
                    cell.setup(name: element.name)
                    return cell
                } else {
                    let cell = tableView.dequeueReusableCell(withIdentifier: self.STUDENT_CELL, for: IndexPath(row: index, section: 0)) as! StudentTableViewCell
                    cell.setup(student: element)
                    return cell
                }
        }
        
        tableView.rx
            .modelSelected(Student.self)
            .subscribe(onNext: { student in
                print("Tocou no aluno \(student.name)")
            }).disposed(by: bag)
        
    }
}
