import UIKit

// 1. Написать функцию, которая определяет, четное число или нет.
func isEven(_ number: Int) {
    if number % 2 == 0 {
        print("\(number) - число четное")
    } else {
        print("\(number) - число нечетное")
    }
}
let first: () = isEven(6)

// 2. Написать функцию, которая определяет, делится ли число без остатка на 3.

func isDivThree(_ number: Int) {
    if number % 3 == 0 {
        print("Число \(number) делиться на 3 без остатка")
    } else {
        print("Число \(number) делиться на 3 с остатком")
    }
}
let second: () = isDivThree(7)

// 3. Создать возрастающий массив из 100 чисел.

var box = [Int]()
for i in 1...100 {
    box.append(i)
}
print(box)

// 4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

// Первый способ
var newArray = [Int]()
for i in 1...100 {
    newArray.append(i)
}
var index = 0
for i in newArray {
    if i % 2 == 0 || i % 3 != 0 {
        newArray.remove(at: index)
        index -= 1
    }
    index += 1
}
print(newArray)

// Второй способ
for num in box {
    if num % 2 == 0 || num % 3 != 0 {
        box.remove(at: (box.firstIndex(of: num)!))
    }
}
print(box)

// Третий способ
var array = [Int]()
for i in 1...100 {
    if i % 2 != 0 && i % 3 == 0 {
        array.append(i)
    }
}
print(array)

/* 5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов. Числа Фибоначчи определяются соотношениями Fn=Fn-1 + Fn-2.*/

func fibonacci(max: Int) -> Int {
    var first = 0
    var second = 1
    for _ in 0..<max {
        let sum = first
        first = second
        second += sum
    }
    return first
}
func arrayIntAt(max: Int) -> [Int] {
    var array = [Int]()
    for i in 0..<max {
        array.append(fibonacci(max: i))
    }
    return array
}
arrayIntAt(max: 50)

/* 6. * Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:
a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
b. Пусть переменная p изначально равна двум — первому простому числу.
c. Зачеркнуть в списке числа от 2 + p до n, считая шагом p..
d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
e. Повторять шаги c и d, пока возможно.*/

func isPrime(num: Int) -> Bool {
    for i in 2..<num {
        if num % i == 0 || num < 2 {
            return false
        }
    }
    return true
}
let prime = isPrime(num: 91)

var arrayOfPrimes = [Int]()
for i in 2..<100 {
    if isPrime(num: i) {
        arrayOfPrimes.append(i)
    }
}
print(arrayOfPrimes)
