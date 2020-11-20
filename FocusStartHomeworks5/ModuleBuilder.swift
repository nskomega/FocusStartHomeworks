//
//  ModuleBuilder.swift
//  FocusStartHomeworks5
//
//  Created by Mikhail Danilov on 20.11.2020.
//

import Foundation
import UIKit

class ModuleBuilder {
    
    static func mainVC() -> UIViewController {
    
        let viewController = MainViewController()
        let view = MainView()
        let router = MainViewRouter(view: viewController)
        let viewModel = MainViewModel(router: router)
        view.setup(viewModel: viewModel)
        viewController.setup(view: view)
        return viewController
    }
    
    static func secondVC(newCar: ((Car) -> ())? ) -> UIViewController {
        
        let viewController = SecondViewController()
        let view = SecondView()
        let router = SecondViewRouter(view: viewController)
        let viewModel = SecondViewModel(router: router, newCar: newCar)
        view.setup(viewModel: viewModel)
        viewController.view = view
        return viewController
    }
}
