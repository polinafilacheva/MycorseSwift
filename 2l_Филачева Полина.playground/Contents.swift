import UIKit


var evens = [Int]()

evens = Array(1...10).filter { (number) in number % 2 == 0 }
print(evens)

evens = Array(1...10).filter { (number) in number % 3 == 0 }
print(evens)


func even(number: Int) -> Bool {
    if number % 2 == 0 {
        return true
    } else {
        return false
    }
}

func notEven(number: Int) -> Bool {
    if number % 3 == 0 {
        return true
    } else {
        return false
    }
}

var array: [Int] = Array(1...100)

for (_, value) in array.enumerated() {
    if even(number: value) == true {
        array.remove(at: array.firstIndex(of: value)!)
    } else if  notEven(number: value) == false {
        array.remove(at: array.firstIndex(of:value)!)
    }
}
print("\(array) \n")

//for element in array where (number%2 == 0) || (number%3 == 0) {
//    array.remove(at : (array.firstIndex(of: element)!))
//    print(array)





