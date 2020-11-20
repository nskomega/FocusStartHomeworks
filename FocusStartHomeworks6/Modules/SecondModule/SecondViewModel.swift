//
//  SecondViewModel.swift
//  FocusStartHomeworks5
//
//  Created by Mikhail Danilov on 11.11.2020.
//

import Foundation

protocol SecondViewModelProtocol: AnyObject {
    func tapBack()
    func saveCar(marka: String, model: String, gosNomer: String)
    var newCar: ((Car) -> ())? { get set}
}

class SecondViewModel: SecondViewModelProtocol {
    
    private let router: SecondViewRouterProtocol
    weak var mainViewModel: MainViewModelProtocol?
    var newCar: ((Car) -> ())?
    
    init(router: SecondViewRouterProtocol, newCar: ((Car) -> ())? ) {
        self.newCar = newCar
        self.router = router
    }
    
    func tapBack() {
        router.close()
    }
    
    func saveCar(marka: String, model: String, gosNomer: String) {
        let car = Car(marka: marka, model: model, gosNomer: gosNomer)
        newCar?(car)
        router.close()
    }
}
