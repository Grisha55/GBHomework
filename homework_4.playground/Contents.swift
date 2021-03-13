import UIKit

/*
 1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
 2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
 3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
 4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
 5. Создать несколько объектов каждого класса. Применить к ним различные действия.
 6. Вывести значения свойств экземпляров в консоль.
 */

enum MotorAction {
    case start
    case stop
    case sportAction
}

enum WindowsAction {
    case open
    case close
}

enum TrunkAction {
    case takeOn
    case takeOut
    case checkStatusOfTrunk
}
enum Cars {
    case Subaru
    case Ferrari
    case BMW
    case Lada
    case Lamborgini
    case Gazel
}

class Car {
    
    var motorAction: MotorAction
    let trunkAction: TrunkAction
    let windowsAction: WindowsAction
    let mark: Cars
    let year: Int
    let wheels: Int
    let isReadyForStart: Bool
    let driverNumber: Int
    func isReady() {
        print("Двигатель заведен, пристегните ремни!!!")
    }
    
    init(motorAction: MotorAction, trunkAction: TrunkAction, windowsAction: WindowsAction, mark: Cars, year: Int, wheels: Int, isReadyForStart: Bool, driverNumber: Int) {
        self.mark = mark
        self.year = year
        self.wheels = wheels
        self.isReadyForStart = isReadyForStart
        self.driverNumber = driverNumber
        self.motorAction = motorAction
        self.trunkAction = trunkAction
        self.windowsAction = windowsAction
    }
}

class TrunkCar: Car {
    
    let trunkVolume: Int
    var weight: Double
    override func isReady() {
        if weight > 10_000 {
            print("Необходимо заехать на взвешивание!")
        } else {
            print("Все отлично!")
        }
    }
    init(motorAction: MotorAction, trunkAction: TrunkAction, windowsAction: WindowsAction, trunkVolume: Int, weight: Double, year: Int, wheels: Int, isReadyForStart: Bool, driverNumber: Int) {
        self.trunkVolume = trunkVolume
        self.weight = weight
        super.init(motorAction: motorAction, trunkAction: trunkAction, windowsAction: windowsAction, mark: .Gazel, year: year, wheels: wheels, isReadyForStart: isReadyForStart, driverNumber: driverNumber)
    }
}

class SportCar: Car {
    
    var speed: Int
    let numberOfCar: Int
    override func isReady() {
        if speed > 300 {
            print("Срочно уменьшите скорость, иначе машина взлетит!")
        } else {
            print("Можно прибавить скорость")
        }
    }
    
    init(motorAction: MotorAction, trunkAction: TrunkAction, windowsAction: WindowsAction, speed: Int, numberOfCar: Int, isReadyForStart: Bool, driverNumber: Int) {
        self.speed = speed
        self.numberOfCar = numberOfCar
        super.init(motorAction: motorAction, trunkAction: trunkAction, windowsAction: windowsAction, mark: .Ferrari, year: 2021, wheels: 4, isReadyForStart: isReadyForStart, driverNumber: driverNumber)
    }
}

var trunkCar = TrunkCar(motorAction: .start, trunkAction: .takeOn, windowsAction: .close, trunkVolume: 393, weight: 100_000, year: 1, wheels: 4, isReadyForStart: true, driverNumber: 1)
trunkCar.weight = 10_000
trunkCar.isReady()

var sportCar = SportCar(motorAction: .sportAction, trunkAction: .takeOn, windowsAction: .close, speed: 310, numberOfCar: 1, isReadyForStart: true, driverNumber: 2)
sportCar.speed = 350
sportCar.isReady()

// print

print(sportCar.numberOfCar)
print(sportCar.speed)
print(sportCar.driverNumber)
print(sportCar.isReadyForStart)
print(sportCar.mark)
print(sportCar.motorAction)
print(sportCar.trunkAction)
