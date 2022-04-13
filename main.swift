//
//  main.swift
//  GeekBrains Lessons
//
//  Created by Колосов Алексей on 13.04.2022.
//

import Foundation

// Задание №1
// формула a(x*x) + bx + c = 0

var a: Double = 10 //используем тип Double, чтобы потом воспользоваться sqrt типа Double
var b: Double = 25
var c: Double = 4


var result: Double = 0
if (b * b) - (4 * a * c) < 0 {
    print("Корней нет")
} else if (b * b) - (4 * a * c) == 0 {
    result = -b / (2 * a)
    print("Единственный корень \(result)")
} else {
    result = b / (2 * a)
    let result2 = (-b + (sqrt(result))) / (2 * a) //первый корень уравнения
    let result3 = (-b - (sqrt(result))) / (2 * a) //второй корень уравнения
    print("Два корня: Первый: \(NSString(format: "%.2f", result2)), Второй \(NSString(format: "%.2f", result3))") // Ограничиваем числа после запятой
}


//Задание № 2
// Найти площадь, периметр и гипотенузу прямоугольного треугольника
 // Чтобы отличалось от задания на вебинаре, сделал через словарь

let legsOfTriangle: Dictionary<String, Float> = ["AB" : 3 , "AC": 4] // Создаем словарь для катетов

let hypotenuse = sqrt(pow((legsOfTriangle["AB"]!), 2) + pow((legsOfTriangle["AC"]!), 2))
print("Гипотянуза равна: \(hypotenuse)")
//возвращаем опционал через ! в данном случае это безопасно, но лучше использовать if let или != nil
let squareOfTriangle = (legsOfTriangle["AB"]! * legsOfTriangle["AC"]!) / 2
print("Площадь треугольника равна: \(squareOfTriangle)")

let perimeter = sqrt(pow((legsOfTriangle["AB"]!), 2) + pow((legsOfTriangle["AC"]!), 2)) +
legsOfTriangle["AB"]! + legsOfTriangle["AC"]!
print("Периметр треугольника равен: \(perimeter)")


//Задание № 3
//дополнил задание, чтобы можно было указывать срок вклада

print("Введите сумму вклада")
let depositAmount = Float(readLine()!)!  // возвращаем значение типа Float
print("Введите годовой процент")
let yearPercentage = Float(readLine()!)!
print("Укажите срок вклада в годах")
let numOfYears = Float(readLine()!)!
// создаем функцию расчета сложного процента
func calculationOfProfit(_ depositAmount: Float, _ yearPercentage: Float, _ numOfYears: Float) -> Float {
    let result = depositAmount * pow((1 + (yearPercentage / 100)), numOfYears)
        return result
    }
// обращаемся к функции с входными параметрами, которые запросили у пользователя
var result1 = calculationOfProfit(depositAmount, yearPercentage, numOfYears)
print("Ваша прибыль составит: \(result1 - depositAmount)")




