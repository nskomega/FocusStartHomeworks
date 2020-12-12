//
//  Person.swift
//  FocusStartHomeworks8
//
//  Created by Mikhail Danilov on 06.12.2020.
//

import Foundation
import RealmSwift

class Person: Object {
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    @objc dynamic var age = 0
    @objc dynamic var workExperience = 0
    @objc dynamic var education = ""
    @objc dynamic var position = ""
    @objc dynamic var companyId = 0
    
    func update(_ name: String, _ age: Int, _ workExperience: Int, _ education: String, _ position : String) {
        self.name = name
        self.age = age
        self.workExperience = workExperience
        self.education = education
        self.position = position
    }
}
