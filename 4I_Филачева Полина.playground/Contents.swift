import UIKit

class Car {
    enum Color {
        case yellow
        case purple
        case black
    }
    
    enum EngineState {
        case start
        case stop
    }
    
    
    enum WindowState {
        case open
        case close
    }
    
    enum LampPosition {
        case on
        case off
    }
    
    enum ActionCar {
        case changeEngineState
        case changeWindowState
        case changeLampPosition
    }
    
    
    let color: Color
    var engineState: EngineState
    var windowState: WindowState
    var lampPosition: LampPosition
    var yearOfProduction: Int = 0
    
    init(color: Color, yearOfProduction: Int) {
        self.color = color
        self.yearOfProduction = yearOfProduction
        engineState = .stop
        windowState = .close
        lampPosition = .off
    }
    
    func action (_ action: ActionCar){
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
        }
    }
    
    
    
    func description() {
        print("""
            \n
            color: \(color)
            engineState: \(engineState)
            windowState: \(windowState)
            lampPosition: \(lampPosition)
            yearOfProduction: \(yearOfProduction)
            """)
    }
}

enum Color {
    case yellow
    case purple
    case black
}

enum EngineState {
    case start
    case stop
}


enum WindowState {
    case open
    case close
}

enum LampPosition {
    case on
    case off
}

enum ActionCar {
    case changeEngineState
    case changeWindowState
    case changeLampPosition
}


let color: Color
var engineState: EngineState
var windowState: WindowState
var lampPosition: LampPosition
var yearOfProduction: Int = 0

init(color: Color, yearOfProduction: Int) {
    self.color = color
    self.yearOfProduction = yearOfProduction
    engineState = .stop
    windowState = .close
    lampPosition = .off
}

func action (_ action: ActionCar){
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
    }
}

func description() {
    print("""
        \n
        color: \(color)
        engineState: \(engineState)
        windowState: \(windowState)
        lampPosition: \(lampPosition)
        yearOfProduction: \(yearOfProduction)
        """)
}

class Sport: Car {
    
    enum sportCarBrend {
        case maserati
        case astonmartin
        case ferrari
    }
    enum ActionsForSportCar {
        case setTurboMode
        case setSportMode
        case setCruiseMode
        case setCityMode
    }
    
    var currentMode: String
    var maxSpeed: Double
    var price: Double
    
    init(color: Color, yearOfManufacture: Int, maxSpeed: Double, price: Double) {
        self.maxSpeed = maxSpeed
        self.price = price
        self.currentMode = "Нет режима"
        super.init(color: color, yearOfProduction: yearOfManufacture)
    }
    
    func action (_ action: ActionsForSportCar){
        switch action {
        case .setCityMode:
            currentMode = "режим: CityMode"
            print(currentMode)
        case .setCruiseMode:
            currentMode = "режим: CruiseMode"
            print(currentMode)
        case .setSportMode:
            currentMode = "режим: SportMode"
            print(currentMode)
        case .setTurboMode:
            currentMode = "режим: TurboMode"
            print(currentMode)
        }
    }
    
    override func description() {
        super.description()
        print("""
            currentMode: \(currentMode)
            maxSpeed: \(maxSpeed)
            price: \(price)
            \n
            """)
    }
}

//Не понимаю, почему на 125 строке ошибка
// Несовсем поняла про объекты, успела сделать только половину задания, обязательно его доделаю.



