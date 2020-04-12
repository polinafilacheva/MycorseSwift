import UIKit

struct Queue<M> {

private var some: [M] = []

mutating func enq(_ one: M) {
    some.append(one)
}

mutating func dequeue() -> M? {
    guard some.isEmpty == false else { return nil }
    return some.removeFirst()
}
}

func addArray(elements: [String], operation: ([String]) -> [String]) -> [String] {
    return operation(elements)
}

addArray(elements: ["Yo", " ", "You are f bad guy"]) { elements in
    var result: [String] = []
    elements.forEach { element in
        result.append(element)
    }
    return result
}
