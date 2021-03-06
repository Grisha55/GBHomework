import UIKit

/*
 1. Решить квадратное уравнение.
 2. Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.
 3. *Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.

 */
//

// Квадратное уравнение

let a = 5.0
let b = 7.0
let c = -2.0
let D = b * b - 4 * a * c
if D > 0 {
    let x1 = (-b - sqrt(D)) / (2 * a)
    let x2 = (-b + sqrt(D)) / (2 * a)
    print("Первый корень: \(x1), второй корень: \(x2)")
} else if D == 0 {
    let x = -b / (2 * a)
    print("Корень уравнения: \(x)")
} else {
    print("Корней нет")
}

// Прямоугольный треугольник

let first = 5.0
let second = 7.0
// Площадь
let S = first * second / 2
print("Площадь равна: \(S)")
// Периметр
let P = sqrt(Double(first * first + second * second + (first + second)))
print("Периметр равен: \(P)")
// Гипотенуза
let G = sqrt(Double(first * first + second * second))
print("Гипотенуза равна: \(G)")

// Банковская программа

// Вклад пользователя
var userSum = 10.0
// Процент
let procent = 10.0
for _ in 1...5 {
    let sum = userSum / 100 * procent
    userSum += sum
}
print("Итог:", userSum)
