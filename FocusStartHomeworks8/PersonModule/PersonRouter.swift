//
//  PersonRouter.swift
//  FocusStartHomeworks8
//
//  Created by Mikhail Danilov on 06.12.2020.
//

import Foundation
import UIKit

protocol PersonRouterProtocol: AnyObject {
    func showAddPerson(companyId: Int, dataService: DataService)
}

final class PersonRouter: PersonRouterProtocol {
    
    // MARK: Properties
    private weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    // MARK: Internal helpers

    func showAddPerson(companyId: Int, dataService: DataService) {
        let vc = ModuleBuilder.addPersonVC(companyId: companyId, dataService: dataService)
        viewController?.present(vc, animated: true, completion: nil)
    }
}
