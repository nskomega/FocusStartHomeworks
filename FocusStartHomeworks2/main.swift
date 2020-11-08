//
//  main.swift
//  FocusStartHomeworks2
//
//  Created by Mikhail Danilov on 25.10.2020.
//

import Foundation

let myThread = ThreadSafeArray<Int>()

let processGroup = DispatchGroup()
let backgroundQ = DispatchQueue.global(qos: .utility)

processGroup.enter()
backgroundQ.async(group: processGroup, execute: {
    for number in 1...1000 {
        myThread.append(number)
        print("   1")
    }
    processGroup.leave()
})

processGroup.enter()
backgroundQ.async(group: processGroup, execute: {
    for number in 1...1000 {
        myThread.append(number)
        print("        2")
    }
    processGroup.leave()
})

print("///////////")

processGroup.notify(queue: DispatchQueue.main, execute: {
    print("All Done")
    print("myThread.count()>", myThread.count())
})

processGroup.wait()

let el = myThread[4]

print(el)
print("All Done")
print("myThread.count()>", myThread.count())
