//
//  MainViewModel.swift
//  FocusStartHomeworks5
//
//  Created by Mikhail Danilov on 11.11.2020.
//

import Foundation

protocol MainViewProtocol {
    func sendNewCar(car: Car)
}

protocol MainViewModelProtocol: AnyObject {
    func tapMainButton ()
    func save(car: Car)
    var delegate: MainViewProtocol? { get set }
}

class MainViewModel: MainViewModelProtocol {
    
    private let router: MainViewRouterProtocol
    var delegate: MainViewProtocol?
    
    init(router: MainViewRouterProtocol) {
        self.router = router
    }
    
    func tapMainButton () {
        router.showSecondView(mainViewModel: self)
    }
    
    func save(car: Car) {
        delegate?.sendNewCar(car: car)
    }
}
