//
//  PersonViewModel.swift
//  FocusStartHomeworks8
//
//  Created by Mikhail Danilov on 06.12.2020.
//

import Foundation
import RxSwift
import RxCocoa

protocol PersonViewModelProtocol: AnyObject {
    func tapAddPerson()
    var persons: [Person] { get set }
    var personListCount: BehaviorRelay<Int>{ get }
    func deletePerson(person: Person, index: Int)
}

final class PersonViewModel: PersonViewModelProtocol {


    // MARK: Constants

    // MARK: Properties
    private let router: PersonRouter
    private let dataService: DataService
    private let companyId: Int
    var persons = [Person]()
    var personListCount = BehaviorRelay<Int>(value: 0)
    var disposeBag = DisposeBag()
    
    init(companyId: Int, router: PersonRouter, dataService: DataService) {
        self.router = router
        self.dataService = dataService
        self.companyId = companyId
        

        
        self.dataService.chageDataBasePersonList.asObservable()
            .subscribe(onNext: { [ weak self] value in
                print("chageDataBasePersonList>companyId", companyId)
                self?.persons = dataService.getPersons(companyId: companyId)
                self?.personListCount.accept(1)
            }).disposed(by: disposeBag)
    }
    
    // MARK: Methods
    func tapAddPerson() {
        router.showAddPerson(companyId: companyId, dataService: dataService)
    }
    
    func deletePerson(person: Person, index: Int) {
        persons.remove(at: index)
        dataService.deletePerson(personId: person.id)
    }
}
