//
//  ThreadSafeArray.swift
//  FocusStartHomeworks2
//
//  Created by Mikhail Danilov on 28.10.2020.
//

import Foundation

class ThreadSafeArray<T> {
    
    private var array: [T] = []
    
    private let accessQueue = DispatchQueue(label: "SynchronizedArrayAccess", attributes: .concurrent)
    
    func append(_ item: T) {
        self.accessQueue.async(flags: .barrier) {
            self.array.append(item)
        }
    }
    
    func remove(at index: Int) {
        self.accessQueue.async(flags: .barrier) {
            if self.array.count > index {
                self.array.remove(at: index)
            }
        }
    }
    
    public subscript(index: Int) -> T? {
        get {
            var element: T?
            accessQueue.sync(flags: .barrier) {
                if array.count > index {
                    element = self.array[index]
                }
            }
            return element
        }
    }
    
    func isEmpty() -> Bool {
        return array.isEmpty
    }
    
    func count() -> Int {
        accessQueue.sync(flags: .barrier) {
            return array.count
        }
    }
}

extension ThreadSafeArray where T: Equatable {
    func contains(_ element: T) -> Bool {
        accessQueue.sync(flags: .barrier) {
            return array.contains(element)
        }
    }
}
