//
//  MainRouter.swift
//  FocusStartHomeworks5
//
//  Created by Mikhail Danilov on 11.11.2020.
//

import Foundation
import UIKit

protocol MainViewRouterProtocol: AnyObject {
    func showSecondView(newCar: ((Car) -> ())?)
}

final class MainViewRouter: MainViewRouterProtocol {
    
    // MARK: Properties
    weak var view: UIViewController?
    
    init(view: UIViewController) {
        self.view = view
    }
    
    func showSecondView(newCar: ((Car) -> ())?) {
        let vc = ModuleBuilder.secondVC(newCar: newCar)
        self.view?.navigationController?.pushViewController(vc, animated: true)
    }
}
