//
//  SecondRouter.swift
//  FocusStartHomeworks5
//
//  Created by Mikhail Danilov on 11.11.2020.
//

import Foundation
import UIKit

protocol SecondViewRouterProtocol: class {
    func close()
}

final class SecondViewRouter: SecondViewRouterProtocol {
    
    // MARK: Properties
    weak var view: UIViewController?
    
    init(view: UIViewController) {
        self.view = view
    }
    
    func close() {
        view?.navigationController?.popViewController(animated: true)
    }
}
