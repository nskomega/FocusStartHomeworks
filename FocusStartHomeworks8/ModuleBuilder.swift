//
//  ModuleBuilder.swift
//  FocusStartHomeworks8
//
//  Created by Mikhail Danilov on 06.12.2020.
//

import Foundation
import UIKit

class ModuleBuilder {
    
    static func personsVC(companyId: Int, dataService: DataService) -> UIViewController {
    
        let viewController = PersonViewController()
        let view = PersonView()
        let router = PersonRouter(viewController: viewController)
        let viewModel = PersonViewModel(companyId: companyId, router: router, dataService: dataService)
        view.setup(viewModel: viewModel)
        viewController.view = view
        viewController.view.backgroundColor = .white

        return viewController
    }
    
    static func companyVC(dataService: DataService) -> UIViewController {
        
        let viewController = CompanyViewController()
        let view = CompanyView()
        let router = CompanyRouter(viewController: viewController)
        let viewModel = CompanyViewModel(router: router, dataService: dataService)
        view.setup(viewModel: viewModel)
        viewController.view = view
        viewController.view.backgroundColor = .white
        
        return viewController
    }
    
    static func addPersonVC(companyId: Int, dataService: DataService) -> UIViewController {
    
        let viewController = AddPersonViewController()
        let view = AddPersonView()
        let router = AddPersonRouter(viewController: viewController)
        let viewModel = AddPersonViewModel(companyId: companyId, router: router, dataService: dataService)
        view.setup(viewModel: viewModel)
        viewController.view = view
        viewController.view.backgroundColor = .white

        return viewController
    }
    
    static func addCompanyVC(dataService: DataService) -> UIViewController {
        
        let viewController = AddCompanyViewController()
        let view = AddCompanyView()
        let router = AddCompanyRouter(viewController: viewController)
        let viewModel = AddCompanyViewModel(router: router, dataService: dataService)
        view.setup(viewModel: viewModel)
        viewController.view = view
        viewController.view.backgroundColor = .white
        
        return viewController
    }
}
