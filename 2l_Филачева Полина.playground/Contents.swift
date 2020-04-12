import Foundation
//
//
//var evens = [Int]()
//
//evens = Array(1...10).filter { (number) in number % 2 == 0 }
//print(evens)
//
//evens = Array(1...10).filter { (number) in number % 3 == 0 }
//print(evens)
//
//
//func even(number: Int) -> Bool {
//    return number  % 2 == 0
//}
//
//func notEven(number: Int) -> Bool {
//    return number  % 3 == 0
//}
//
//var array: [Int] = Array(1...100)
//
//
//for (_, value) in array.enumerated() {
//    if even(number: value) == true {
//        array.remove(at: array.firstIndex(of: value)!)
//    } else if  notEven(number: value) == false {
//        array.remove(at: array.firstIndex(of:value)!)
//    }
//}
//print("\(array) \n")


//Структуры состоящие из других типов
//содержит свойства, методы и конструкторы

//Создаем новый тип, все типы являются строками
enum FioMode: String {
    case full
    case middle
    case short
    
    var description: String {
        switch self {
        case .full:
            return "Фамилия, Имя, Отчество"
        case .middle:
            return "Фамилия, Имя"
        case .short:
            return "Фамилия"
            
        }
    }
}


func printFio(  fio:(String, String, String), mode: FioMode){
    switch mode {
    case .full:
        print(mode.description, fio.0, fio.1, fio.2)
    case .middle:
        print(mode.description, fio.0, fio.1)
    case .short:
        print(mode.description, fio.0)

    }
}

printFio(fio: ("Иванов", "Иван", "Иванович"), mode: .full)


//enum SoleveResult {
//    case twoSqr(one: Double, two: Double)
//    case oneSqr(one: Double)
//    case none(error: String)
//}
//
//func solveQuard(a: Double, b: Double, c: Double) -> SoleveResult {
//    let discrim: Double = b * b - 4.0 * a * c
//    if discrim == 0 {
//        let x : Double = (-b + sqrt(discrim)) / (2.0 * a)
//        return .oneSqr(one: x)
//        } else if discrim < 0{
//       //Дописать
//    }
//}


enum Body {
    
    case cope
    case hatchback
    case offRoad
    case sedan
      
}

enum EngineState {
    case start
    case stop
    
}

struct Car {
    let model: String
    let brand: String
    let color: String
    
    let engineV: Double
    let power: Double
    
    var price: Int {
        get {
            print("Текущая цена: \(self.price)")
            return self.price
        }
        set {
            self.price = newValue
            print("Цена изменилась на: \(newValue)")
        }
    }
    
    let odd: Double = 0
    
    let body: Body
    
    var engineState: EngineState = .stop {
        
        didSet {
            print("Состояние двигателя было изменено с \(oldValue) на \(self.engineState)")
        }
        willSet {
            print("Состояние двигателя было изменено с \(self.engineState) на \(newValue)")
        }
        
    }
    
    mutating func chnge () {
        if engineState == .stop {
            engineState = .start
        } else {
            engineState = .stop
        }
    }
}

var ladaVesta = Car(model: "Vesta", brand: "vesta", color: "rad", engineV: 1.6, power: 97, body: .sedan)

ladaVesta.price = 583973
let price = ladaVesta.price

ladaVesta.engineState = .start
ladaVesta.chnge()




