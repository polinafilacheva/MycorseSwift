import UIKit
import Foundation

enum Color {
    case yellow
    case purple
    case black
}

enum EngineState {
    case start
    case stop
}

enum Brand {
    case subaru
    case toyota
    case mazda
}

enum WindowState {
    case open
    case close
}

enum LampPosition {
    case on
    case off
}

enum Action {
    case changeEngineState
    case changeWindowState
    case changeLampPosition
    case loadTrunk(Double)
    case unloadTrunk(Double)
}


struct Auto {
    
    
    let status: Class
    let color: Color
    var engineState: EngineState
    let brand: Brand
    var windowState: WindowState
    var lampPosition: LampPosition
    let bodyType: BodyType
    var trunkVolume: Double
    var trunkCondition: Double
    var yearOfProduction: Int
    
    enum Class {
        case a_class
        case b_class
        case c_class
    }
    
    enum BodyType {
        case coupe
        case hatchBack
        case sedan
    }
    
    
    init(status: Class, brand: Brand, bodyType: BodyType, color: Color, yearOfProduction: Int) {
        self.status = status
        self.brand = brand
        self.bodyType = bodyType
        self.color = color
        self.yearOfProduction = yearOfProduction
        trunkVolume = 500
        engineState = .start
        windowState = .close
        lampPosition = .off
        trunkCondition = 0
    
        func action (_ action: Action){
        switch action {
        case .changeEngineState:
            if engineState == .stop {
                engineState = .start
                print("Заведена")
            } else {
                engineState = .stop
                print("Заглушена")
            }
        case .changeLampPosition:
            if lampPosition == .off {
                lampPosition = .on
                print("Свет включен")
            } else {
                lampPosition = .off
                print("Свет отключен")
            }
        case .changeWindowState:
            if windowState == .close {
                windowState = .open
                print("Окна открыты")
            } else {
                windowState = .close
                print("Окна закрыты")
            }
        case .loadTrunk(let value):
            if trunkVolume < value {
                print("Ваш багаж не влезает")
            } else {
                trunkCondition += value
                print("Осталось места: \(trunkVolume - trunkCondition)")
            }
        case .unloadTrunk(let value):
            if trunkCondition - value >= 0 {
                trunkCondition -= value
                print("Осталось места: \(trunkVolume - trunkCondition)")
            } else {
                print("Больше чем есть")
            }
        }
    }
}


    func description() {
         print("""
             \n
             
             brand: \(brand)
             bodyType: \(bodyType)
             color: \(color)
             status: \(status)
             engineState: \(engineState)
             windowState: \(windowState)
             lampPosition: \(lampPosition)
             trunkVolume: \(trunkVolume)
             trunkCondition: \(trunkCondition)
             yearOfProduction: \(yearOfProduction)\n
             """)
     }

 }


var car = Auto(status: .c_class, brand:  .subaru, bodyType: .coupe, color: .yellow, yearOfProduction: 2007 )

car.description()





    


