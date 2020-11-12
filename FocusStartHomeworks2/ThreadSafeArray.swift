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
    
    var isEmpty: Bool {
        get {
            return array.isEmpty
        }
    }
    
    var count: Int {
        get {
            return array.count
        }
    }
    
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
            self.accessQueue.sync {
                if array.count > index {
                    element = self.array[index]
                }
            }
            return element
        }
    }
    
}

extension ThreadSafeArray where T: Equatable {
    func contains(_ element: T) -> Bool {
        self.accessQueue.sync {
            return self.array.contains(element)
        }
    }
}
