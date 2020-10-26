//
//  main.swift
//  FocusStartHomeworks2
//
//  Created by Mikhail Danilov on 25.10.2020.
//

import Foundation

class MyThreadSafe<T: Equatable>{
    
    private var array: [T] = []
    private let accessQueue = DispatchQueue(label: "SynchronizedArrayAccess", attributes: .concurrent)
    
    func append(_ item: T) {
        accessQueue.async(flags: .barrier) {
            self.array.append(item)
        }
    }
    
    func remove(at index: Int) {
        accessQueue.async (flags: .barrier) {
            if self.array.count > index {
                self.array.remove(at: index)
            }
        }
    }
    
    func subScript(index: Int) -> T? {
        if array.count > index {
            return array[index]
        } else {
            return nil
        }
    }
    
    func contains(_ element: T) -> Bool {

        var result = false
        for el in array {
            if el == element {
                result = true
            }
        }
        return result
    }
    
    func isEmpty() -> Bool {
        accessQueue.sync {
            return array.count
        }
        return array.isEmpty
    }
    
    func count() -> Int {
        return array.count
    }
    
}


let myThread = MyThreadSafe<String>()

for number in 1...1000 {
    myThread.append(String(number))
}

myThread.remove(at: 560)

print("myThread.count()>", myThread.count())
