//
//  DataService.swift
//  FocusStartHomeworks8
//
//  Created by Mikhail Danilov on 06.12.2020.
//

import Foundation
import RealmSwift
import RxRelay

protocol DataServiceProtocol {
   func saveCompany(name: String)
   func getCompanies() -> [Company]
   func deleteCompany(company: Company)
   var chageDataBaseCompanyList: BehaviorRelay<Bool> { get set }
   func deletePerson(personId: Int)
}

class DataService: DataServiceProtocol {
    
    private let realm = try! Realm()
    var chageDataBaseCompanyList = BehaviorRelay<Bool>(value: true)
    var chageDataBasePersonList = BehaviorRelay<Bool>(value: true)
    
    func savePerson(person: Person) {
        let id = Int.random(in: 1...999999)
        person.id = id
        print(person.name, "   id>", person.id)
        try! realm.write {
            realm.add(person)
        }
        chageDataBasePersonList.accept(true)
    }
    
    func getPersons(companyId: Int) -> [Person] {
        var result = [Person]()
        let persons = realm.objects(Person.self)//.filter("companyId = " + String(companyId))
        for obj in persons {
            print("person>id>",obj.companyId)
            if obj.companyId == companyId {
              result.append(obj)
            }
        }
        print("getPersons>", persons.count)
        print("getPersons>", result.count)
        return result
    }
    
    func deletePerson(personId: Int) {
        print("deleteCompany>",personId)
        var objects = realm.objects(Person.self)
        var objectForDelete: Person?
        
        for object in objects {
            if object.id == personId {
                objectForDelete = object
            }
        }
        
        try! realm.write {
          realm.delete(objectForDelete!)
        }
    }
    
    func saveCompany(name: String) {
        let company = Company()
        let id = Int.random(in: 1...999999)
        company.name = name
        company.id = id
        print(company.name, "   id>", company.id)
        try! realm.write {
            realm.add(company)
        }
        chageDataBaseCompanyList.accept(true)
    }
    
    func deleteCompany(company: Company) {
        
        deletePersonsForCompany(companyId: company.id)
        
        print("deleteCompany>",company.id)
        var objects = realm.objects(Company.self)
        var objectForDelete: Company?
        
        for object in objects {
            if object.id == company.id {
                objectForDelete = object
            }
        }
        
        try! realm.write {
          realm.delete(objectForDelete!)
        }

        let list = getCompanies()
        print("list>", list.count)
    }
    
    
    func deletePersonsForCompany(companyId: Int) {
        let objects = realm.objects(Person.self).filter("companyId == " + String(companyId))
        
        try! realm.write {
          realm.delete(objects)
        }
    }
    
    
    func getCompanies() -> [Company] {
        var result = [Company]()
        
        let puppies = realm.objects(Company.self) // .filter("age < 2")
        for obj in puppies {
            print("getCompanies>id>",obj.id)
            result.append(obj)
        }
        
        return result
    }
}
