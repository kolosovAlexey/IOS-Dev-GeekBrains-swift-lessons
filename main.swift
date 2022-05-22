//
//  main.swift
//  Lesson 6
//
//  Created by Kolosov Alexey on 05.05.2022.
//

import Foundation


//MARK: - structure Queue
struct Queue<T> {
    var elements: [T] = []
//добавляем элемент
    mutating func enqueue(_ value: T) {
        elements.append(value)
    }

//удаляем из очереди(первый элемент)
mutating func dequeue() -> T? {
    guard !elements.isEmpty else {
        return nil
    }
    return elements.removeFirst()
}
//показывает первый элемент очереди
    var head: T? {
        elements.isEmpty ? nil : elements[0]
    }
    //показывает последний элемент очереди
    var tail: T? {
        elements.isEmpty ? nil : elements.last
    }
//MARK: - Subscript for Queue
    subscript(index: Int) -> T? {
        if index > elements.count - 1 || index < 0 {
            print("Индекс не подходящий")
            return nil
        } else {
            return elements[index]
        }
    }
        //функция фильтрации
    func filtering(_ isIncluded: (T) -> Bool) -> [T] {
        var result = [T]()
        for i in elements {
            if isIncluded(i) {
                result.append(i)
            }
        }
        return result
    }
}

extension Queue: CustomStringConvertible {
    var description: String {
        return "Очередь \(elements)"
    }


}


var intQueue = [Int]()
var stringQueue = [String]()
var anyQueue = [Any]()


var myIntQueueOne = Queue(elements: intQueue)
myIntQueueOne.enqueue(1)
myIntQueueOne.enqueue(2)
myIntQueueOne.enqueue(3)
myIntQueueOne.enqueue(4)
let filtered = myIntQueueOne.filtering{$0 % 2 == 0}
print(filtered)
print(myIntQueueOne[5])
print(myIntQueueOne)

var myStringQueuTwo = Queue(elements: stringQueue)
myStringQueuTwo.enqueue("Masha")
myStringQueuTwo.enqueue("Pasha")
myStringQueuTwo.enqueue("Vasia")
myStringQueuTwo.enqueue("Fedia")
let filteredStringQueue = myStringQueuTwo.filtering {$0.hasPrefix("P")}
print(filteredStringQueue)

var myAnyQueueThree = Queue(elements: anyQueue)
myAnyQueueThree.enqueue(12)
myAnyQueueThree.enqueue(4.12)
myAnyQueueThree.enqueue("HI")
myAnyQueueThree.enqueue(true)
print(myAnyQueueThree)
