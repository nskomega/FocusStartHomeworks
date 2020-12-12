//
//  CompanyViewModel.swift
//  FocusStartHomeworks8
//
//  Created by Mikhail Danilov on 06.12.2020.
//

import Foundation
import RxSwift
import RxCocoa

protocol CompanyViewModelProtocol: AnyObject {
    func tapNewCompany()
    var companyList: [Company] { get }
    var companyListCount: BehaviorRelay<Int> { get }
    func deleteCompay(company: Company, index: Int)
    func selectCompany(id: Int)
}

final class CompanyViewModel: CompanyViewModelProtocol {

    // MARK: Constants

    // MARK: Properties
    private let disposeBag = DisposeBag()
    private let router: CompanyRouter
    private let dataService: DataService?
    var companyListCount = BehaviorRelay<Int>(value: 0)
    
    // MARK: Property
    var companyList = [Company]()
    
    init(router: CompanyRouter, dataService: DataService) {
        self.router = router
        self.dataService = dataService
        
        self.dataService?.chageDataBaseCompanyList.asObservable()
            .subscribe(onNext: { [ weak self] value in
                print("chageDataBaseCompanyList")
                
                self?.updateTableView()
            }).disposed(by: disposeBag)
        updateTableView()
    }
    
    // MARK: Methods
    func tapNewCompany() {
        guard let dataService = dataService else { return }
        router.showAddCompany(dataService: dataService)
    }
    
    func updateTableView() {
        guard let dataService = dataService else { return }
        companyList = dataService.getCompanies()
        companyListCount.accept(companyList.count)
    }
    
    func deleteCompay(company: Company, index: Int) {
        companyList.remove(at: index)
        dataService?.deleteCompany(company: company)
    }
    
    
    func selectCompany(id: Int) {
        guard let dataService = dataService else { return }
        router.showPersonsCompany(companyId: id, dataService: dataService)
    }
}
