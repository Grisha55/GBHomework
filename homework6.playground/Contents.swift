import UIKit

/*1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
 2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
 3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.*/

struct Queue<T: Numeric> {
    
    private var array = [T]()
    
    mutating func push(element: T) {
        array.append(element)
    }
    mutating func pop() -> T? {
        guard !array.isEmpty else {
            return nil
        }
        return array.removeFirst()
    }
    // Умножение всех чисел в массиве на 3
    mutating func filteringArrayWithMap() -> [T] {
        array.map({ $0 * 3 })
    }
    // Оставить только те элементы, которые больше 10
    mutating func filterArrayWithFilter() -> [T] {
        array.filter({ $0.magnitude > 10 })
    }
    // Вычисление суммы чисел в массиве
    mutating func filteringArrayWithReduce() -> T {
        array.reduce(0, +)
    }
    // Проверка на пустоту
    mutating func isThisArrayEmpty() -> Bool {
        array.isEmpty
    }
    // Возвращает первый элемент массива, если такой имеется
    func takeFirstElement() -> T {
        guard let first = array.first else { fatalError("It is empty array!") }
        return first
    }
    // Возвращает последний элемент, если такой имеется
    func takeLastElement() -> T {
        guard let last = array.last else { fatalError("It is empty array!") }
        return last
    }
    // Вычисления квадрата числа массива
    mutating func sqrtNum() -> [T] {
        array.map( { $0 * $0 } )
    }
    // Вывод всех элементов в консоль
    mutating func printAllElements() {
        array.forEach( { print($0) } )
    }
    // Не нужная фигня под названием "subscript"
    subscript(index: Int) -> T? {
        guard index < array.count, !array.isEmpty else { return nil}
        return array[index]
    }
}

var firstQueue = Queue<Int>()
firstQueue.push(element: 10)
firstQueue.push(element: 18)
firstQueue.push(element: 82)
firstQueue.push(element: -49)
firstQueue.push(element: 12)
//print(firstQueue.filteringArrayWithMap())
//print(firstQueue.filterArrayWithFilter())
//print(firstQueue.takeFirstElement())
//print(firstQueue.filteringArrayWithReduce())
firstQueue.pop()
//print(firstQueue.sqrtNum())
firstQueue[0]

