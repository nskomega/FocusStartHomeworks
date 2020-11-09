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
<<<<<<< HEAD
            accessQueue.sync(flags: .barrier) {
=======
            self.accessQueue.sync {
>>>>>>> 1c2d0c478d6464038191bbc73e52877af4bfcff8
                if array.count > index {
                    element = self.array[index]
                }
            }
            return element
        }
    }
    
    func isEmpty() -> Bool {
<<<<<<< HEAD
        return array.isEmpty
=======
        self.accessQueue.sync {
            return self.array.isEmpty
        }
>>>>>>> 1c2d0c478d6464038191bbc73e52877af4bfcff8
    }
    
    func count() -> Int {
        accessQueue.sync {
            return self.array.count
        }
    }
}

extension ThreadSafeArray where T: Equatable {
    func contains(_ element: T) -> Bool {
<<<<<<< HEAD
        accessQueue.sync(flags: .barrier) {
            return array.contains(element)
=======
        self.accessQueue.sync {
            return self.array.contains(element)
>>>>>>> 1c2d0c478d6464038191bbc73e52877af4bfcff8
        }
    }
}
