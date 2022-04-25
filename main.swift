//
//  main.swift
//  Lesson 4
//
//  Created by Kolosov Alexey on 25.04.2022.
//

import Foundation
// описание возможных действий с авто
enum ManipulationWhithCar {
    case engineOn, enigeOff
    case windowsClose, windowsOpen
    case carIsLocked, carIsUnLocked
    case cleanCar, dirtyCar
    case lightsOn, lightsOff
    case noNeedRepair, needToBeFixed
    case fueled, needToTunkUp
    case white, black, yellow, gray, silver, green, red
    // описание действий с грузовиком
    enum IsTruckEvaible: String {
        case avaible = "Свободен", busy = "На выезде"
    }
    // описание действий с грузовиком
    enum NumOfWheals: Int {
        case fourWheals = 4, eightWheals = 8
    }
    // описание действий с грузовиком
    enum TruckIsEmpty: String {
        case empty = "Пустой", loaded = "Загружен"
    }
    /*
     Использую данный метод, чтобы можно было добавлять значения другого типа
     к примеру var mod2: Int  итам перечислиб бы цифровые значения, при этом enum бы не менялся
     */
    var mod: String {
        switch self {
        case .engineOn:
            return "Двигатель включен"
        case .enigeOff:
            return "Двигатель выключен"
        case .windowsClose:
            return "Окна закрыты"
        case .windowsOpen:
            return "Окна открыты"
        case .carIsLocked:
            return "Машина закрыта"
        case .carIsUnLocked:
            return "Машина открыта"
        case .cleanCar:
            return "Машина чистая"
        case .dirtyCar:
            return "Машина грязная"
        case .lightsOn:
            return "Свет включон"
        case .lightsOff:
            return "Свет выключен"
        case .noNeedRepair:
            return "Машина на ходу"
        case .needToBeFixed:
            return "Требуется ремонт"
        case .fueled:
            return "Машина заправлена"
        case .needToTunkUp:
            return "Нужна дозаправка"
        case .white:
            return "Белая"
        case .black:
            return "Черная"
        case .yellow:
            return "Желтая"
        case .gray:
            return "Серая"
        case .silver:
            return "Серебрянная"
        case .green:
            return "Зеленая"
        case .red:
            return "Красная"
        }
    }
}
// Создаем родительский класс Car
class Car {
    var brand: String
    var model: String
    var yearOfIssue: Int
    var sizeOftrunkLiters: Int
    var filledTrundSpace: Int { // Добавляю didset и willset будет работать в дочерних классах т.к свойства одни и теже
        willSet(newFilledTrundSpace) {
            print("Вы положите в багазник \(newFilledTrundSpace) литров объема")
        }
        didSet {
            print("В багажник было добавлено \(oldValue) литров объема")
        }
    }
    var sizeOfBodyMeters: Double

    init(brand: String,
         model: String,
         yearOfIssue: Int,
         sizeOftrunkLiters: Int,
         sizeOfBodyMeters: Double,
         filledTrundSpace: Int) {

        self.brand = brand
        self.model = model
        self.yearOfIssue = yearOfIssue
        self.sizeOftrunkLiters = sizeOftrunkLiters
        self.sizeOfBodyMeters = sizeOfBodyMeters
        self.filledTrundSpace = filledTrundSpace

    }
    // создаю функцию, которую потом можно использовать через override
    func fillTheTrunkSpace(weight: Int) {
        self.filledTrundSpace = filledTrundSpace + weight
        self.sizeOftrunkLiters = sizeOftrunkLiters - filledTrundSpace
        if sizeOftrunkLiters < 0 {
            print("Груз не влазиет в какую-то машину") // текст будет меняться в дочерних классах
        }
    }
    // создаю функцию, которую потом можно использовать через override
    func parentOrChildClass(){
        print("Это родительский класс") // текст будет меняться в дочерних классах
    }
}

// Создаю дочерний класс, использую final т.к на него уже ссылаться ничто не будет и код будет быстрей
final class SportCar: Car {

    var enginework = ManipulationWhithCar.engineOn.mod // ссылаюсь на enum и mod чтобы получить сразу String
    var windowsClose = ManipulationWhithCar.windowsClose.mod
    var color = ManipulationWhithCar.white.mod
    var fuled = ManipulationWhithCar.fueled.mod
    var readyToGo = ManipulationWhithCar.noNeedRepair.mod
    var lightsOnOff = ManipulationWhithCar.lightsOn.mod
    var isCarClean = ManipulationWhithCar.cleanCar.mod
    var isCarLocked = ManipulationWhithCar.carIsUnLocked.mod
    ///полный инициализатор
    init(enginework: String,
         windowsClose: String,
         color: String,
         fuled: String,
         readyToGo: String,
         lightsOnOff: String,
         isCarClean: String,
         isCarLocked: String,
         brand: String,
         model: String,
         yearOfIssue: Int,
         sizeOftrunkLiters: Int,
         sizeOfBodyMeters: Double,
         filledTrundSpace: Int) {

        self.enginework = enginework
        self.windowsClose = windowsClose
        self.color = color
        self.fuled = fuled
        self.readyToGo = readyToGo
        self.lightsOnOff = lightsOnOff
        self.isCarClean = isCarClean
        self.isCarLocked = isCarLocked
        super.init(brand: brand,
                   model: model,
                   yearOfIssue: yearOfIssue,
                   sizeOftrunkLiters: sizeOftrunkLiters,
                   sizeOfBodyMeters: sizeOfBodyMeters,
                   filledTrundSpace: filledTrundSpace)
    }
    ///Короткий инициализатор
    override init(brand: String,
                  model: String,
                  yearOfIssue: Int,
                  sizeOftrunkLiters: Int,
                  sizeOfBodyMeters: Double,
                  filledTrundSpace: Int) {

        super.init(brand: brand,
                   model: model,
                   yearOfIssue: yearOfIssue,
                   sizeOftrunkLiters: sizeOftrunkLiters,
                   sizeOfBodyMeters: sizeOfBodyMeters,
                   filledTrundSpace: filledTrundSpace)

    }
    ///погрузка в багажник в спорткар
    override func fillTheTrunkSpace(weight: Int) {  // Использую функцию через override
        self.filledTrundSpace = weight
        self.sizeOftrunkLiters = sizeOftrunkLiters - filledTrundSpace
        print("В багажнике осталось \(sizeOftrunkLiters) литров")
        if sizeOftrunkLiters < 0 {
            print("Груз не влазиет в спортивную машину")
        }
    }
    override func parentOrChildClass() {  // Использую функцию через override
        print("Это класс-наследник")
    }
}

final class TrunkCar: Car {

    var enginework = ManipulationWhithCar.engineOn.mod
    var windowsClose = ManipulationWhithCar.windowsClose.mod
    var color = ManipulationWhithCar.white.mod
    var fuled = ManipulationWhithCar.fueled.mod
    var readyToGo = ManipulationWhithCar.noNeedRepair.mod
    var lightsOnOff = ManipulationWhithCar.lightsOn.mod
    var isCarClean = ManipulationWhithCar.cleanCar.mod
    var isCarLocked = ManipulationWhithCar.carIsUnLocked.mod
    var truckAvaible = ManipulationWhithCar.IsTruckEvaible.avaible.rawValue
    var numbOfwheals = ManipulationWhithCar.NumOfWheals.eightWheals.rawValue
    var isTrunkIsEmpty = ManipulationWhithCar.TruckIsEmpty.empty.rawValue
    private var ageOfTrunk = 0
    ///полный инициализатор
    init(enginework: String,
         windowsClose: String,
         color: String,
         fuled: String,
         readyToGo: String,
         lightsOnOff: String,
         isCarClean: String,
         isCarLocked: String,
         brand: String,
         model: String,
         yearOfIssue: Int,
         sizeOftrunkLiters: Int,
         sizeOfBodyMeters: Double,
         truckAvaible: String,
         numbOfwheals: Int,
         isTrunkIsEmpty: String,
         filledTrundSpace: Int) {

        self.enginework = enginework
        self.windowsClose = windowsClose
        self.color = color
        self.fuled = fuled
        self.readyToGo = readyToGo
        self.lightsOnOff = lightsOnOff
        self.isCarClean = isCarClean
        self.isCarLocked = isCarLocked
        self.truckAvaible = truckAvaible
        self.numbOfwheals = numbOfwheals
        self.isTrunkIsEmpty = isTrunkIsEmpty
        super.init(brand: brand,
                   model: model,
                   yearOfIssue: yearOfIssue,
                   sizeOftrunkLiters: sizeOftrunkLiters,
                   sizeOfBodyMeters: sizeOfBodyMeters,
                   filledTrundSpace: filledTrundSpace)
    }
    ///Короткий инициализатор
    init(numbOfwheals: Int,
         brand: String,
         model: String,
         yearOfIssue: Int,
         sizeOftrunkLiters: Int,
         sizeOfBodyMeters: Double,
         filledTrundSpace: Int) {

        self.numbOfwheals = numbOfwheals
        super.init(brand: brand,
                   model: model,
                   yearOfIssue: yearOfIssue,
                   sizeOftrunkLiters: sizeOftrunkLiters,
                   sizeOfBodyMeters: sizeOfBodyMeters,
                   filledTrundSpace: filledTrundSpace)

    }
    ///погрузка в грузовик
    override func fillTheTrunkSpace(weight: Int) {
        self.filledTrundSpace = filledTrundSpace + weight
        self.sizeOftrunkLiters = sizeOftrunkLiters - filledTrundSpace
        print("В багажнике осталось \(sizeOftrunkLiters) литров")
        if sizeOftrunkLiters < 0 {
            print("Груз не влазиет в грузовую машину")
        }
    }
    // функция меняет статус "свободен" на "в пути"
    func changeStatusAvailability() {
        if self.truckAvaible == ManipulationWhithCar.IsTruckEvaible.avaible.rawValue {
            truckAvaible = ManipulationWhithCar.IsTruckEvaible.busy.rawValue
        } else if self.truckAvaible == ManipulationWhithCar.IsTruckEvaible.busy.rawValue {
            truckAvaible = ManipulationWhithCar.IsTruckEvaible.avaible.rawValue
        }
    }
    override func parentOrChildClass() {
        print("Это класс-наследник")
    }
    ///старый грузовик или нет
    func isTruckOld() {
        self.ageOfTrunk = 2022 - yearOfIssue
        if ageOfTrunk > 20 {
            print("Грузовик старый")
        } else {
            print("Грузовик еще не старый")
        }
    }
}

//создаем экземпляр класса спорт машин
let myAudi = SportCar(enginework: ManipulationWhithCar.engineOn.mod,
                      windowsClose: ManipulationWhithCar.windowsClose.mod,
                      color: ManipulationWhithCar.white.mod,
                      fuled: ManipulationWhithCar.fueled.mod,
                      readyToGo: ManipulationWhithCar.noNeedRepair.mod,
                      lightsOnOff: ManipulationWhithCar.lightsOn.mod,
                      isCarClean: ManipulationWhithCar.cleanCar.mod,
                      isCarLocked: ManipulationWhithCar.carIsUnLocked.mod,
                      brand: "Audi",
                      model: "RS6",
                      yearOfIssue: 2018,
                      sizeOftrunkLiters: 565,
                      sizeOfBodyMeters: 4.54,
                      filledTrundSpace: 0)

let myBmw = SportCar(brand: "BMW",
                     model: "M5",
                     yearOfIssue: 2019,
                     sizeOftrunkLiters: 420,
                     sizeOfBodyMeters: 4.78,
                     filledTrundSpace: 0)


//кладем груз в багажник. Показывает: Сколько положим, сколько положили, сколько места осталось, вмещается ли груз
myBmw.fillTheTrunkSpace(weight: 100)
/*
 Вы положите в багазник 100 литров объема
 В багажник было добавлено 0 литров объема
 В багажнике осталось 320 литров
 */
myBmw.fillTheTrunkSpace(weight: 200)
/*
 Вы положите в багазник 200 литров объема
 В багажник было добавлено 100 литров объема
 В багажнике осталось 120 литров
*/
myBmw.fillTheTrunkSpace(weight: 140)
/*
 Вы положите в багазник 140 литров объема
 В багажник было добавлено 200 литров объема
 В багажнике осталось -20 литров
 Груз не влазиет в спортивную машину
*/


myAudi.parentOrChildClass()

//создаем экземпляр класса грузовиков
let truckVolvo = TrunkCar(enginework: ManipulationWhithCar.engineOn.mod,
                          windowsClose: ManipulationWhithCar.windowsClose.mod,
                          color: ManipulationWhithCar.white.mod,
                          fuled: ManipulationWhithCar.fueled.mod,
                          readyToGo: ManipulationWhithCar.noNeedRepair.mod,
                          lightsOnOff: ManipulationWhithCar.lightsOn.mod,
                          isCarClean: ManipulationWhithCar.cleanCar.mod,
                          isCarLocked: ManipulationWhithCar.carIsUnLocked.mod,
                          brand: "Volvo",
                          model: "HR14",
                          yearOfIssue: 1988,
                          sizeOftrunkLiters: 30000,
                          sizeOfBodyMeters: 13.45,
                          truckAvaible: ManipulationWhithCar.IsTruckEvaible.avaible.rawValue,
                          numbOfwheals: ManipulationWhithCar.NumOfWheals.eightWheals.rawValue,
                          isTrunkIsEmpty: ManipulationWhithCar.TruckIsEmpty.empty.rawValue,
                          filledTrundSpace: 0)


let truckGaz = TrunkCar(numbOfwheals: ManipulationWhithCar.NumOfWheals.eightWheals.rawValue,
                        brand: "Gaz",
                        model: "Gazel",
                        yearOfIssue: 2013,
                        sizeOftrunkLiters: 10000,
                        sizeOfBodyMeters: 4.89,
                        filledTrundSpace: 0)


print(truckVolvo.truckAvaible) // Свободен

truckVolvo.changeStatusAvailability()

print(truckVolvo.truckAvaible) // На выезде

truckVolvo.parentOrChildClass() // Это класс-наследник

truckVolvo.isTruckOld() // Грузовик старый

truckGaz.isTruckOld() // Грузовик еще не старый
