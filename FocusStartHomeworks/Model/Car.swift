//
//  Car.swift
//  FocusStartHomeworks
//
//  Created by Mikhail Danilov on 18.10.2020.
//

import Foundation

enum Body: String {
    case none = "none"
    case sedan = "sedan"
    case universal = "universal"
    case jeep = "jeep"
    case cupe = "cupe"
}

class Car{
    var manufacturer: String = ""
    var model: String = ""
    var body: Body?
    var yearOfIssue: Int = 0
    var carNumber: String = ""
    
    
    init(manufacturer: String,
         model: String,
         body: Body,
         yearOfIssue: Int,
         carNumber: String) {
        self.yearOfIssue = yearOfIssue
        self.manufacturer = manufacturer
        self.model = model
        self.body = body
        self.carNumber = carNumber
    }
}
