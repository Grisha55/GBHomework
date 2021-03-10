import UIKit

/*
 1. Описать несколько структур – любой легковой автомобиль и любой грузовик.
 2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
 3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
 4. Добавить в ваши структуры метод с одним аргументом типа вашего перечисления, который будет менять свойства структуры в зависимости от действия.
 5. Инициализировать несколько экземпляров ваших структур. Применить к ним различные действия.
 6. Вывести значения свойств экземпляров в консоль.

 */

enum MotorAction {
    case start
    case stop
}

enum WindowsAction {
    case open
    case close
}

enum TrunkAction {
    case takeOn
    case takeOut
}
enum Cars {
    case Subaru
    case Ferrari(speed: Int)
    case BMW
    case Lada
    case Lamborgini(speed: Int)
}

struct Car {
    var mark: String
    let year: Int
    var trunkVolume: Double
    let isMotorActive: Bool
    let isOpenWindows: Bool
    let filledTrunkVolume: Double
    init(mark: String, year: Int, trunkVolume: Double, isMotorActive: Bool, filledTrunkVolume: Double) {
        self.mark = mark
        self.year = year
        self.trunkVolume = trunkVolume
        self.isMotorActive = isMotorActive
        self.filledTrunkVolume = filledTrunkVolume
        self.isOpenWindows = true
    }
    mutating func trunkStatus(trunkVolume: Double) {
        if isMotorActive {
            self.trunkVolume -= 100
        }
    }
    mutating func chooseMark(mark: Cars) {
        switch mark {
        case .BMW:
            self.mark = "BMW"
        case .Ferrari(let speed) where speed > 200:
            self.mark = "Ferrari"
            print("Немедленно снизьте скорость")
        case .Lada:
            self.mark = "Lada"
        case .Lamborgini(let speed) where speed > 220:
            self .mark = "Lamborgini"
            print("Вы оштрафованы на 200 000 рублей")
        case .Ferrari:
            self.mark = "Ferrari"
            print("Крутая тачка")
        case .Lamborgini:
            self.mark = "Lamborgini"
            print("Крутая машина")
        case .Subaru:
            self.mark = "Subaru"
        }
    }
}

struct Lorry {
    var mark: String
    let year: Int
    var trunkVolume: Double
    var isMotorActive: Bool
    let isOpenWindows: Bool
    var filledTrunkVolume: Double
    init(year: Int, trunkVolume: Double, isMotorActive: Bool, isOpenWindows: Bool, filledTrunkVolume: Double) {
        self.mark = "Gazel"
        self.year = year
        self.trunkVolume = trunkVolume
        self.isMotorActive = isMotorActive
        self.isOpenWindows = isOpenWindows
        self.filledTrunkVolume = filledTrunkVolume
    }
    mutating func statusOfTrunk(volume: Double) {
        if isMotorActive {
            self.trunkVolume -= 300
        }
    }
    mutating func checkBenzine() {
        if isMotorActive || filledTrunkVolume > 50 {
            trunkVolume -= 1000
            print("Будте внимательнее, бензин может закончиться")
        }
    }
}

var car_one = Car(mark: "Ferrari", year: 5, trunkVolume: 1000, isMotorActive: true, filledTrunkVolume: 2000)
car_one.trunkStatus(trunkVolume: 1000)
car_one.trunkVolume
car_one.chooseMark(mark: .Ferrari(speed: 240))
car_one.mark

var car_two = Car(mark: "Ferrari", year: 1, trunkVolume: 120.34, isMotorActive: true, filledTrunkVolume: 2323.232)
car_two.trunkStatus(trunkVolume: 500)
car_two.trunkVolume
car_two.chooseMark(mark: .Lamborgini(speed: 190))
car_two.mark

var lorry_1 = Lorry(year: 5, trunkVolume: 2000, isMotorActive: true, isOpenWindows: true, filledTrunkVolume: 2500)
// Заглушили мотор
lorry_1.isMotorActive = false
// Выгрузили груз
lorry_1.filledTrunkVolume = 0
// Проверили бензин
lorry_1.checkBenzine()
lorry_1.trunkVolume

// Вывод в консоль
print(lorry_1.mark)
print(lorry_1.year)
print(lorry_1.trunkVolume)
print(lorry_1.isMotorActive)
print(lorry_1.isOpenWindows)
print(lorry_1.filledTrunkVolume)
