//
//  ViewController.swift
//  RxCocoaGettinStart
//
//  Created by Felipe Petersen on 02/04/20.
//  Copyright © 2020 Felipe Petersen. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var searchStudentTextField: UITextField!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tiaLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    var studentName: String?
    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchWithBinding()
        // Do any additional setup after loading the view.
    }
    
    func setupSearch() {
        self.searchStudentTextField.rx.text
            .filter { ($0 ?? "").count > 0 }
            .flatMap { text in
                StudentController.shared.getStudent(named: text ?? "error")}
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { (student) in
                self.nameLabel.text = student.name
                self.ageLabel.text = student.age
                self.tiaLabel.text = student.tia
            }).disposed(by: bag)
    }
    
    func setupSearchWithBinding() {
        let searchResult = self.searchStudentTextField.rx.text
        .filter { ($0 ?? "").count > 0 }
        .flatMap { text in
            StudentController.shared.getStudent(named: text ?? "error")}
        .observeOn(MainScheduler.instance)
        
        searchResult.map { $0.name }
            .bind(to: self.nameLabel.rx.text)
            .disposed(by: bag)
        // --podemos fazer isso para todas as outras labels--
    }
    
    func setupSearchWithUnits() {
        let searchResult = self.searchStudentTextField.rx.controlEvent(.editingDidEndOnExit).map { self.searchStudentTextField.text }
        .filter { ($0 ?? "").count > 0 }
        .flatMapLatest { text in
            StudentController.shared.getStudent(named: text ?? "error")}
        .asDriver(onErrorJustReturn: Student(name: "", tia: "", age: ""))
        
        searchResult.map { $0.name }
            .drive(self.nameLabel.rx.text)
            .disposed(by: bag)
        // --podemos fazer isso para todas as outras labels--
    }
    
    
}

