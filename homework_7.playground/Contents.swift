import UIKit

/*2. Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws - функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch. */

// Регистрация на сайт

enum LoginErrors: Error {
    case incorrectLogin
    case incorrectPassword
}
enum OtherErrors: Error {
    case gender
    case age
    case cartBalance
}
enum Gender {
    case male
    case female
}
let trueLogin = "123456"
let truePassword = "ABC"

class Login {
    func checkData(login: String, password: String) throws {
        guard login == trueLogin else { throw LoginErrors.incorrectLogin }
        guard password == truePassword else { throw LoginErrors.incorrectPassword}
    }
    func checkOtherData(gender: Gender, age: Int, cartBalance: Int) throws {
        guard gender == .male else { throw OtherErrors.gender }
        guard age > 18 else { throw OtherErrors.age }
        guard cartBalance > 1000 else { throw OtherErrors.cartBalance}
    }
}
let userLogin = Login()

do {
    try userLogin.checkData(login: "123456", password: "159")
} catch LoginErrors.incorrectLogin {
    print("Не верный логин")
} catch LoginErrors.incorrectPassword {
    print("Не верный пароль")
}

do {
    try userLogin.checkOtherData(gender: .male, age: 19, cartBalance: 1000)
} catch OtherErrors.gender {
    print("Вход разрешен только мальчикам")
} catch OtherErrors.age {
    print("Вход разрешен только лицам достигшим 18 лет")
} catch OtherErrors.cartBalance {
    print("На вашей карте не достаточно средств")
}

// Сайт по покупке монитора

enum SomeErrors: Error {
    case firm
    case price
    case color
    case style
}
enum Firms {
    case LG
    case Apple
    case Asus
    case Dell
    case HP
}
enum Style {
    case straight
    case concave
}

class BuyingMonitor {
    func buying(firm: Firms, price: Int, color: UIColor, style: Style) throws {
        guard firm !=  .Apple else { throw SomeErrors.firm }
        guard price > 20_000 else { throw SomeErrors.price }
        guard color != .black else { throw SomeErrors.color }
        guard style != .straight else { throw SomeErrors.style }
    }
}

let user = BuyingMonitor()

do {
    try user.buying(firm: .LG, price: 21_000, color: .black, style: .concave)
} catch SomeErrors.firm {
    print("Мониторов фирмы Apple нет в наличии, но скоро должен быть привоз")
} catch SomeErrors.price {
    print("Все мониторы находятся в ценовой категории за 20_000 рублей")
} catch SomeErrors.color {
    print("К сожалению черного цвета нет в наличии")
} catch SomeErrors.style {
    print("Вогнутые мониторы закончились")
}

// Запись к тренеру

enum ErrorsOfTrainings: Error {
    case expansiveTrainer
    case nameOfTrainer
    case age
}
enum BehaviourErrors: Error {
    case badBehaviour
    case badWords
    case spoiledProperty
}

enum Trainers {
    case Kirill
    case Sergey
    case Ivan
    case Ben
}

class TrainerPractice {
    func haveTrainer(money: Int, nameOfTrainer: Trainers, age: Int) throws {
        guard money > 1200 else { throw ErrorsOfTrainings.expansiveTrainer }
        guard nameOfTrainer != .Ben else { throw ErrorsOfTrainings.nameOfTrainer }
        guard age > 12 else { throw ErrorsOfTrainings.age }
    }
    func behaviour(badBehaviour: Bool, badWords: Bool, spoiledProperty: Bool) throws {
        guard !badBehaviour else { throw BehaviourErrors.badBehaviour }
        guard !badWords else { throw BehaviourErrors.badWords }
        guard !spoiledProperty else { throw BehaviourErrors.spoiledProperty }
    }
}
let person = TrainerPractice()

do {
    try person.haveTrainer(money: 1200, nameOfTrainer: .Kirill, age: 13)
} catch ErrorsOfTrainings.expansiveTrainer {
    print("Цены за тренировку превышают 1200 рублей")
} catch ErrorsOfTrainings.nameOfTrainer {
    print("К сожалению у этого тренера полная запись на месяц")
} catch ErrorsOfTrainings.age {
    print("Мы не берем детей младше 12 лет")
}

do {
    try person.behaviour(badBehaviour: false, badWords: false, spoiledProperty: true)
} catch BehaviourErrors.badBehaviour {
    print("Ведите себя достойно, иначе получите штраф")
} catch BehaviourErrors.badWords {
    print("Контролируйте свою лексику, иначе охрана вас выведет из заведения ")
} catch BehaviourErrors.spoiledProperty {
    print("Вам необходимо оплатить ремонт, испорченного вами имущества")
}
