//
//  MainViewModel.swift
//  FocusStartHomeworks5
//
//  Created by Mikhail Danilov on 11.11.2020.
//

import Foundation

protocol MainViewModelProtocol: AnyObject {
    func tapMainButton ()
    var newCar: ((Car) -> ())? { get set}
}

class MainViewModel: MainViewModelProtocol {
    
    private let router: MainViewRouterProtocol
    var newCar: ((Car) -> ())?
    
    init(router: MainViewRouterProtocol) {
        self.router = router
    }
    
    func tapMainButton () {
        router.showSecondView(newCar: newCar)
    }
    
    func save(car: Car) {
        newCar?(car)
    }
}
