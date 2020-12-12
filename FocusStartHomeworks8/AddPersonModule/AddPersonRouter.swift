//
//  AddPersonRouter.swift
//  FocusStartHomeworks8
//
//  Created by Mikhail Danilov on 06.12.2020.
//

import Foundation
import UIKit

protocol AddPersonRouterProtocol: AnyObject {
    func close()
}

final class AddPersonRouter: AddPersonRouterProtocol {
    
    // MARK: Properties
    private weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    // MARK: Internal helpers

    func close() {
        viewController?.dismiss(animated: true, completion: nil)
    }
}
