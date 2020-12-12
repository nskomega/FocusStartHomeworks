//
//  AddCompanyViewModel.swift
//  FocusStartHomeworks8
//
//  Created by Mikhail Danilov on 06.12.2020.
//

import Foundation
import RxSwift
import RxCocoa

protocol AddCompanyViewModelProtocol: AnyObject {
    func tapSaveNewCompany(name: String)
}

final class AddCompanyViewModel: AddCompanyViewModelProtocol {

    // MARK: Constants

    // MARK: Properties
    private let router: AddCompanyRouter
    private var dataService: DataService?
    
    init(router: AddCompanyRouter, dataService: DataService) {
        self.router = router
        self.dataService = dataService
    }
    
    // MARK: Methods
    func tapSaveNewCompany(name: String) {
        dataService?.saveCompany(name: name)
        router.close()
    }
}
