//
//  MainRouter.swift
//  FocusStartHomeworks5
//
//  Created by Mikhail Danilov on 11.11.2020.
//

import Foundation
import UIKit

protocol MainViewRouterProtocol: class {
    func showSecondView(mainViewModel: MainViewModelProtocol)
}

final class MainViewRouter: MainViewRouterProtocol {
    
    // MARK: Properties
    weak var view: UIViewController?
    
    init(view: UIViewController) {
        self.view = view
    }
    
    
    func showSecondView(mainViewModel: MainViewModelProtocol) {
        let viewController = SecondViewController()
        let router = SecondViewRouter(view: viewController)
        let viewModel = SecondViewModel(router: router)
        
        viewController.setup(viewModel: viewModel)
        viewModel.mainViewModel = mainViewModel
        
        self.view?.navigationController?.pushViewController(viewController, animated: true)
    }
}
