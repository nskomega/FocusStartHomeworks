//
//  Company.swift
//  FocusStartHomeworks8
//
//  Created by Mikhail Danilov on 06.12.2020.
//

import Foundation
import RealmSwift

class Company: Object {
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    
    func update(_ name: String) {
        self.name = name
    }
}
