//
//  AddPersonViewModel.swift
//  FocusStartHomeworks8
//
//  Created by Mikhail Danilov on 06.12.2020.
//

import Foundation
import RxSwift
import RxCocoa

protocol AddPersonViewModelProtocol: AnyObject {
    func tapSavePerson(name: String,  age:Int, experience: Int, education: String, position: String)
}

final class AddPersonViewModel: AddPersonViewModelProtocol {

    // MARK: Constants

    // MARK: Properties
    private let router: AddPersonRouter
    private let dataService: DataService
    private let companyId: Int
    
    init(companyId: Int, router: AddPersonRouter, dataService: DataService) {
        self.router = router
        self.dataService = dataService
        self.companyId = companyId
    }
    
    // MARK: Methods
    func tapSavePerson(name: String, age: Int, experience: Int, education: String, position: String) {
        let  person = Person()
        person.name = name
        person.age = age
        person.workExperience = experience
        person.education = education
        person.position = position
        person.companyId = companyId
        print("companyId>", companyId)
        dataService.savePerson(person: person)
        router.close()
    }
}
