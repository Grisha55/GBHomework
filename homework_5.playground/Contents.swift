import UIKit

/*
 1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
 2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
 3. Создать два класса, имплементирующих протокол «Car»: trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
 4. Для каждого класса написать расширение, имплементирующее протокол «CustomStringConvertible».
 5. Создать несколько объектов каждого класса. Применить к ним различные действия.
 6. Вывести сами объекты в консоль.*/

protocol Car: AnyObject {
    
    var mark: String { get set }
    var year: Int { get set }
    var color: String { get set }
    var speed: Int { get set }
    var windowsStatus: Bool { get set }
    var motorStatus: Bool { get set }
    func start()
}
extension Car {
    
    func windowsStatus(status: Bool) {
        self.windowsStatus = status
    }
    func motorStatus(status: Bool) {
        self.motorStatus = status
    }
}
class SportCar: Car {
    
    var maxSpeed: Int
    var number: Int
    var windowsStatus: Bool
    var motorStatus: Bool
    var mark: String
    var year: Int
    var color: String
    var speed: Int
    func start() {
        print("Машина готова к старту")
    }
    init(mark: String, year: Int, color: String, speed: Int, windowsStatus: Bool, motorStatus: Bool, maxSpeed: Int, number: Int) {
        self.mark = mark
        self.year = year
        self.color = color
        self.speed = speed
        self.windowsStatus = windowsStatus
        self.motorStatus = motorStatus
        self.maxSpeed = maxSpeed
        self.number = number
    }
}
class TrunkCar: Car {
    
    var trunkVolume: Int
    var weight: Double
    var motorStatus: Bool
    var windowsStatus: Bool
    var mark: String
    var year: Int
    var color: String
    var speed: Int
    func start() {
        print("Машина готова к пути")
    }
    init(mark: String, year: Int, color: String, speed: Int, motorStatus: Bool, windowsStatus: Bool, trunkVolume: Int, weight: Double) {
        self.mark = mark
        self.year = year
        self.color = color
        self.speed = speed
        self.motorStatus = motorStatus
        self.windowsStatus = windowsStatus
        self.trunkVolume = trunkVolume
        self.weight = weight
    }
}
extension SportCar: CustomStringConvertible {
    
    func checkSpeed() {
        if speed > 340 {
            print("Снизьте скорость!")
        } else {
            print("Скорость в норме")
        }
    }
    var description: String {
        return "Марка машины \(mark), она \(year) года, ее цвет \(color), ее максимальная скорость \(maxSpeed) км/ч, а сейчас у нее скорость \(speed) км/ч, эта машина под номером \(number)"
    }
}
extension TrunkCar: CustomStringConvertible {
    
    func checkWeight() {
        if weight > 3000 {
            print("У грузовика перебор груза, необходимо ее разгрузить")
        } else {
            print("У грузовика нет перебора по весу")
        }
    }
    var description: String {
        return "Машина марки \(mark), она \(year) года, ее цвет \(color), сейчас у нее скорость \(speed) км/ч, ее вес составляет \(weight) кг, ее объем бака равен \(trunkVolume) литров"
    }
}
let sportCar = SportCar(mark: "BMW", year: 2021, color: "белый", speed: 350, windowsStatus: true, motorStatus: true, maxSpeed: 400, number: 1)
sportCar.checkSpeed()

let trunkCar = TrunkCar(mark: "Gaz", year: 1999, color: "коричневый", speed: 100, motorStatus: true, windowsStatus: false, trunkVolume: 1000, weight: 3200.36)
trunkCar.checkWeight()

print(sportCar)
print(trunkCar)
