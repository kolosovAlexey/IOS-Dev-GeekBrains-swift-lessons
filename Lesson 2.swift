//
//  Lesson 2.swift
//  GeekBrain Lessons
//
//  Created by Kolosov Alexey on 16.04.2022.
//

import Foundation


//перечисления
//задание №1

// Пишет целое число или нет
/*
func checkIfEven(someNum: Int) -> String {
    if someNum % 2 == 0 {
        return "Число целое"
    } else {
        return "Число не целое"
    }
}
var anyNum = checkIfEven(someNum: 11)
print(anyNum)
*/
//задание №2
// Делится ли число на 3 без остатка
/*
func checkIfEven(someNum: Int) -> String {
    if someNum % 3 == 0 {
        return "Делится на 3 без остатка"
    } else {
        return "Не делится на 3 без остатка"
    }
}
var anyNum = checkIfEven(someNum: 6)
print(anyNum)
*/

//Задание №3
//Создать возрастающий массив из 100 чисел

/*
var array1 = Array(stride(from: 0, through: 199, by: 2)) //тут все четные числа кроме 0 и 199
array1.count

var array2 = Array(1...100)// и четные и не четные числа
*/

//задание №4
//удалить из массива четные числа и числа которые не делятся на 3

//1йвариант
/*
var array2 = Array(1...100)

var array3 = [Int]()
    for i in 1...100 {
        if i % 2 == 0 {
            array3.append(i)
    }
}
//print(array3)

var array4: [Int] = []
for y in 1...100 {
    if y % 3 == 0 {
        array4.append(y)
    }
}
//print(array5)

var newSet = Set(array2)
var newSet2 = Set(array3)
var newSet4 = Set(array4)

let result = newSet.subtracting(newSet2)
let finalResult = result.subtracting(newSet4)
print(finalResult)
*/

//2й вариант
/*
var mainArray = Array(1...100)
var evenArray = Array(1...100).filter{$0 % 2 == 0}
var evenThreeArray = Array(1...100).filter{$0 % 3 == 0}

var newSet = Set(mainArray)
var newSet2 = Set(evenArray)
var newSet4 = Set(evenThreeArray)

let result = newSet.subtracting(newSet2)
let finalResult = result.subtracting(newSet4)
print(finalResult)
*/



// задание № 5

/*
func appendArray(_ element: Int, in fibonachiArray: inout [Int]) {
    return fibonachiArray.append(element)
}

func newFibonachi(someArray: inout[Int]) -> Int {
    someArray.count-1 + someArray.count-2
}

var fibonachiArray = [4, 5, 3, 4, 6, 7]


while fibonachiArray.count <= 50 {
    newFibonachi(someArray: &fibonachiArray)
    appendArray(newFibonachi(someArray: &fibonachiArray), in: &fibonachiArray)
}

print(fibonachiArray)
*/

//Задание №6
// заполнить массив простыми числа методом перебора

//1й вариан
/*
var allNumbers = (2...100)
var p = 2

var newNum = Array(stride(from: 2 + p, through: 100, by: p))

var newSet = Set(allNumbers)
var newSet1 = Set(newNum)

var subtrSet = newSet.subtracting(newSet1)

//print(subtrSet.sorted())

var p2 = 3
var newNum2 = Array(stride(from: 2 + p2, through: 100, by: p2))
var newSet3 = Set(newNum2)

var resultSet = subtrSet.subtracting(newSet3)

print(resultSet.sorted())

var p3 = 7
var newNum3 = Array(stride(from: 2 + p2, through: 100, by: p3))
var newSet4 = Set(newNum3)

var resultSet1 = resultSet.subtracting(newSet4)
print(resultSet1.sorted())

//  и так далее

*/

//2й вариант

/*
func isEasyNum(number: Int) -> Bool {
    for i in 2..<number {
        if number % i == 0 {
            return false
        }
    }
    return true
}
var allNumbers2 = (2...100).filter(isEasyNum)
print(allNumbers2)

*/
