import UIKit


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

protocol Car {
    
    var color: Color { get }
    var yearOfProduction: Int { get }
    var engineState: EngineState { get set }
    var windowState: WindowState { get set }
    var lampPosition: LampPosition { get set }
}

extension Car {
    mutating func changeEngineState() {
        if engineState == .stop {
            engineState = .start
            print("Двигатель незаведен")
        } else {
            engineState = .stop
            print("Двигатель заведен")
        }
    }
}

extension Car {
    mutating func changeLampPosition() {
        if lampPosition == .off {
            lampPosition = .on
            print("Включены")
        } else {
            lampPosition = .off
            print("Отключены")
        }
    }
}

extension Car {
    mutating func changeWindowState() {
        if windowState == .close {
            windowState = .open
            print("Открыты")
        } else {
            windowState = .close
            print("Закрыты")
        }
    }
}

class Truck: Car {

    

    enum TruckModel {
        case man
        case iveco
        case daf
        case scania
    }
    enum TypeTruck {
        case panel
        case dump
        case garbage
        case flatbed
    }

    enum ActionTruck {
        case loadTruck(Double)
        case unloadTruck(Double)
    }

    let color: Color
    var yearOfProduction: Int = 0
    var engineState: EngineState
    var windowState: WindowState
    var lampPosition: LampPosition
    let truckModel: TruckModel
    let typeTruck: TypeTruck
    var maxWeight: Double = 0.0
    var maxVolume: Double = 0.0
    var currentVolume: Double = 0.0

    init(color: Color, yearOfProduction: Int, maxWeight: Double, maxVolume: Double, TruckModel: TruckModel, TypeTruck: TypeTruck) {
        self.color = color
        self.yearOfProduction = yearOfProduction
        self.truckModel = TruckModel
        self.typeTruck = TypeTruck
        self.maxVolume = maxVolume
        self.maxWeight = maxWeight
        engineState = .stop
        windowState = .close
        lampPosition = .off
    }

    func action (_ action: ActionTruck){
        switch action {
        case .loadTruck(let value):
            if maxVolume < value {
                print("не влезает")
            } else {
                currentVolume += value
                print("осталось места: \(maxVolume - currentVolume)")
            }
        case .unloadTruck(let value):
            if currentVolume - value >= 0 {
                currentVolume -= value
                print("осталось места: \(maxVolume - currentVolume)")
            } else {
                print("нет такого груза")
            }
        }
    }
}

extension Truck: CustomStringConvertible {
    var description: String {
        return ("""
            maxWeight: \(maxWeight)
            maxVolume: \(maxVolume)
            currentVolume: \(currentVolume)
            color: \(color)
            engineState: \(engineState)
            windowState: \(windowState)
            lampPosition: \(lampPosition)
            yearOfProduction: \(yearOfProduction)
            \n
            """)
    }
}

var truck1 = Truck(color: .purple, yearOfProduction: 2003, maxWeight: 1500, maxVolume: 23800, TruckModel: .iveco, TypeTruck: .flatbed)
var truck2 = Truck(color: .yellow, yearOfProduction: 1856, maxWeight: 6548, maxVolume: 8980, TruckModel: .iveco, TypeTruck: .garbage)

truck1.maxVolume
truck1.action(.unloadTruck(78999))
truck1.changeEngineState()

truck2.maxVolume
truck2.changeWindowState()
truck2.changeEngineState()

print(truck1)
print(truck2)
