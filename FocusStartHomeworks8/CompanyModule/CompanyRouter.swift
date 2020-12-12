//
//  CompanyRouter.swift
//  FocusStartHomeworks8
//
//  Created by Mikhail Danilov on 06.12.2020.
//

import Foundation
import UIKit

protocol CompanyRouterProtocol: AnyObject {
    func showAddCompany(dataService: DataService)
    func showPersonsCompany(companyId: Int, dataService: DataService)
}

final class CompanyRouter: CompanyRouterProtocol {
    
    // MARK: Properties
    private weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    // MARK: Internal helpers

    func showAddCompany(dataService: DataService) {
        let vc = ModuleBuilder.addCompanyVC(dataService: dataService)
        viewController?.present(vc, animated: true, completion: nil)
    }
    
    func showPersonsCompany(companyId: Int, dataService: DataService){
        let vc = ModuleBuilder.personsVC(companyId: companyId, dataService: dataService)
        viewController?.present(vc, animated: true, completion: nil)
    }
}
