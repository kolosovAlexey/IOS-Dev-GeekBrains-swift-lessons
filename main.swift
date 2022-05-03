//
//  main.swift
//  Lesson 5
//
//  Created by Kolosov Alexey on 01.05.2022.
//

import Foundation
//перечисления действий с авто
enum ManipulationWhithCar {
    case engineOn, enigeOff
    case windowsClose, windowsOpen
    case carIsLocked, carIsUnLocked
    case cleanCar, dirtyCar
    case lightsOn, lightsOff
    case noNeedRepair, needToBeFixed
    case fueled, needToTunkUp
    case white, black, yellow, gray, silver, green, red

    enum IsTruckEvaible: String {
        case avaible = "Свободен",
             busy = "На выезде"
    }

    enum NumOfWheals: Int {
        case fourWheals = 4,
             eightWheals = 8
    }

    enum TruckIsEmpty: String {
        case empty = "Пустой",
             loaded = "Загружен"
    }

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
            return "Свет включен"
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

// Скелет машины через протокол
protocol CarProtocol {
    var brand: String { get }
    var model: String { get }
    var yearOfIssue: Int { get }
    var sizeOftrunkLiters: Int { get }
    var sizeOfBodyMeters: Double { get }
}
// протокол заправки авто
protocol FillTheTrunkProtocol {
    var filledTrundSpace: Int { get }
    func fillTheTrunkSpace(weight: Int)
}
// Протокол опредления класса авто
protocol SportOrTrunkCarProtocol {
    func whatClassIsCar()
}
// протокол смены статуса грузовика
protocol IstruckAvaibleProtocol {
    var truckAvaible: String { get set}
    func changeStatusAvailability()
}
// Протокол показывающий старый грузовик или нет
protocol IsTruckOldProtocol {
    func isTruckOld()
}
// Протокол показывающий загружен или пуст грузовик
protocol IstruckEmptyProtocol {
    var isTrunkIsEmpty: String { get set}
    func trunkIsemty()
}
// Протокол включить/выключить двигатель
protocol TurnOnOfTheEngineProtocol {
    func turnOnOfTheEngine(enginework: String)
}
// Создаем класс спорткар
final class SportCar: CarProtocol {
    var brand: String
    var model: String
    var yearOfIssue: Int
    var sizeOftrunkLiters: Int
    var sizeOfBodyMeters: Double
    var filledTrundSpace: Int {
        willSet(newFilledTrundSpace) {
            print("Вы положите в багажник \(brand) \(newFilledTrundSpace) литров объема")
        }
        didSet {
            print("В \(brand) было добавлено \(oldValue) литров объема")
        }
    }
    var enginework = ManipulationWhithCar.engineOn.mod
    var windowsClose = ManipulationWhithCar.windowsClose.mod
    var color = ManipulationWhithCar.white.mod
    var fuled = ManipulationWhithCar.fueled.mod
    var readyToGo = ManipulationWhithCar.noNeedRepair.mod
    var lightsOnOff = ManipulationWhithCar.lightsOn.mod
    var isCarClean = ManipulationWhithCar.cleanCar.mod
    var isCarLocked = ManipulationWhithCar.carIsUnLocked.mod

    init(brand: String,
         model: String,
         yearOfIssue: Int,
         sizeOftrunkLiters: Int,
         sizeOfBodyMeters: Double,
         enginework: String,
         windowsClose: String,
         color: String,
         fuled: String,
         readyToGo: String,
         lightsOnOff: String,
         isCarClean: String,
         isCarLocked: String,
         filledTrundSpace: Int) {

        self.brand = brand
        self.model = model
        self.yearOfIssue = yearOfIssue
        self.sizeOftrunkLiters = sizeOftrunkLiters
        self.sizeOfBodyMeters = sizeOfBodyMeters
        self.enginework = enginework
        self.windowsClose = windowsClose
        self.color = color
        self.fuled = fuled
        self.readyToGo = readyToGo
        self.lightsOnOff = lightsOnOff
        self.isCarClean = isCarClean
        self.isCarLocked = isCarLocked
        self.filledTrundSpace = filledTrundSpace
    }
// удобный инит
    convenience init(brand: String,
                     model: String,
                     yearOfIssue: Int,
                     sizeOftrunkLiters: Int,
                     sizeOfBodyMeters: Double,
                     filledTrundSpace: Int) {
        self.init(brand: brand,
                  model: model,
                  yearOfIssue: yearOfIssue,
                  sizeOftrunkLiters: sizeOftrunkLiters,
                  sizeOfBodyMeters: sizeOfBodyMeters,
                  enginework: ManipulationWhithCar.engineOn.mod,
                  windowsClose: ManipulationWhithCar.windowsClose.mod,
                  color: ManipulationWhithCar.white.mod,
                  fuled: ManipulationWhithCar.fueled.mod,
                  readyToGo: ManipulationWhithCar.noNeedRepair.mod,
                  lightsOnOff: ManipulationWhithCar.lightsOn.mod,
                  isCarClean: ManipulationWhithCar.cleanCar.mod,
                  isCarLocked: ManipulationWhithCar.carIsUnLocked.mod,
                  filledTrundSpace: filledTrundSpace)
    }
    
}
// Создаем читаемый вид вывода в консоль
extension SportCar: CustomStringConvertible {
    var description: String {
        return """
                Марка: \(brand)
                Модель: \(model)
                Год выпуска: \(yearOfIssue)
                Объем богажника \(sizeOftrunkLiters)
                Длина машины: \(sizeOfBodyMeters)
                Двигатель: \(enginework)
                Окна: \(windowsClose)
                Цвет: \(color)
                Заправлена?: \(fuled)
                Требуется ремонт?: \(readyToGo)
                Свет включен?: \(lightsOnOff)
                Машина чистая?: \(isCarClean)
                Открыта?: \(isCarLocked)
                Сколько занято литров багажника: \(filledTrundSpace)
                """
    }
}

extension SportCar: FillTheTrunkProtocol {

    func fillTheTrunkSpace(weight: Int) {
        self.filledTrundSpace = weight
        self.sizeOftrunkLiters = sizeOftrunkLiters - filledTrundSpace
        print("В багажнике \(brand) осталось \(sizeOftrunkLiters) литров")
        if sizeOftrunkLiters < 0 {
            print("Груз не влазиет в спортивную машину")
        }
    }
}

extension SportCar: SportOrTrunkCarProtocol {
    func whatClassIsCar() {
        print("Машина класса спорт-кар")
    }
}

extension SportCar: TurnOnOfTheEngineProtocol {
    func turnOnOfTheEngine(enginework: String) {
        if enginework == "On" {
            self.enginework = ManipulationWhithCar.engineOn.mod
        } else if enginework == "Off" {
            self.enginework = ManipulationWhithCar.enigeOff.mod
        }
    }
}
// Создаем класс грузовик
final class TrunkCar: CarProtocol {
    var brand: String
    var model: String
    var yearOfIssue: Int
    var sizeOftrunkLiters: Int
    var sizeOfBodyMeters: Double
    var filledTrundSpace: Int {
        willSet(newFilledTrundSpace) {
            print("Вы положите в багажник \(brand) \(newFilledTrundSpace) литров объема")
        }
        didSet {
            print("В \(brand) было добавлено \(oldValue) литров объема")
        }
    }

    var enginework = ManipulationWhithCar.engineOn.mod
    var windowsClose = ManipulationWhithCar.windowsClose.mod
    var color = ManipulationWhithCar.white.mod
    var fuled = ManipulationWhithCar.fueled.mod
    var readyToGo = ManipulationWhithCar.noNeedRepair.mod
    var lightsOnOff = ManipulationWhithCar.lightsOn.mod
    var isCarClean = ManipulationWhithCar.cleanCar.mod
    var isCarLocked = ManipulationWhithCar.carIsUnLocked.mod
    var numbOfwheals = ManipulationWhithCar.NumOfWheals.eightWheals.rawValue
    private var ageOfTrunk = 0
    var truckAvaible: String
    var isTrunkIsEmpty: String

    init(brand: String,
         model: String,
         yearOfIssue: Int,
         sizeOftrunkLiters: Int,
         sizeOfBodyMeters: Double,
         enginework: String,
         windowsClose: String,
         color: String,
         fuled: String,
         readyToGo: String,
         lightsOnOff: String,
         isCarClean: String,
         isCarLocked: String,
         numbOfwheals: Int,
         filledTrundSpace: Int,
         truckAvaible: String,
         isTrunkIsEmpty: String) {

        self.brand = brand
        self.model = model
        self.yearOfIssue = yearOfIssue
        self.sizeOftrunkLiters = sizeOftrunkLiters
        self.sizeOfBodyMeters = sizeOfBodyMeters
        self.enginework = enginework
        self.windowsClose = windowsClose
        self.color = color
        self.fuled = fuled
        self.readyToGo = readyToGo
        self.lightsOnOff = lightsOnOff
        self.isCarClean = isCarClean
        self.isCarLocked = isCarLocked
        self.numbOfwheals = numbOfwheals
        self.filledTrundSpace = filledTrundSpace
        self.truckAvaible = truckAvaible
        self.isTrunkIsEmpty = isTrunkIsEmpty
    }
    convenience init(brand: String,
                     model: String,
                     yearOfIssue: Int,
                     sizeOftrunkLiters: Int,
                     sizeOfBodyMeters: Double){
        self.init(brand: brand,
                  model: model,
                  yearOfIssue: yearOfIssue,
                  sizeOftrunkLiters: sizeOftrunkLiters,
                  sizeOfBodyMeters: sizeOfBodyMeters,
                  enginework: ManipulationWhithCar.engineOn.mod,
                  windowsClose: ManipulationWhithCar.windowsClose.mod,
                  color: ManipulationWhithCar.white.mod,
                  fuled: ManipulationWhithCar.fueled.mod,
                  readyToGo: ManipulationWhithCar.noNeedRepair.mod,
                  lightsOnOff: ManipulationWhithCar.lightsOn.mod,
                  isCarClean: ManipulationWhithCar.cleanCar.mod,
                  isCarLocked: ManipulationWhithCar.carIsUnLocked.mod,
                  numbOfwheals: ManipulationWhithCar.NumOfWheals.eightWheals.rawValue,
                  filledTrundSpace: 0,
                  truckAvaible: ManipulationWhithCar.IsTruckEvaible.avaible.rawValue,
                  isTrunkIsEmpty: ManipulationWhithCar.TruckIsEmpty.empty.rawValue)
    }
}

extension TrunkCar: CustomStringConvertible {
    var description: String {
        return """
                Марка: \(brand)
                Модель: \(model)
                Год выпуска: \(yearOfIssue)
                Объем богажника \(sizeOftrunkLiters)
                Длина машины: \(sizeOfBodyMeters)
                Двигатель: \(enginework)
                Окна: \(windowsClose)
                Цвет: \(color)
                Заправлена?: \(fuled)
                Требуется ремонт?: \(readyToGo)
                Свет включен?: \(lightsOnOff)
                Машина чистая?: \(isCarClean)
                Открыта?: \(isCarLocked)
                Сколько занято литров багажника: \(filledTrundSpace)
                Сколько колес у грузовика: \(numbOfwheals)
                Машина свободна: \(truckAvaible)
                Грузовик загружен или пуст: \(isTrunkIsEmpty)

                """
    }
}

extension TrunkCar: FillTheTrunkProtocol {
    func fillTheTrunkSpace(weight: Int) {
        self.filledTrundSpace = weight
        self.sizeOftrunkLiters = sizeOftrunkLiters - filledTrundSpace
        print("В багажнике \(brand) осталось \(sizeOftrunkLiters) литров")
        if sizeOftrunkLiters < 0 {
            print("Груз не влазиет в грузовик")
        }
    }
}

extension TrunkCar: SportOrTrunkCarProtocol {
    func whatClassIsCar() {
        print("Машина класса Грузовик")
    }
}

extension TrunkCar: IstruckAvaibleProtocol {
    func changeStatusAvailability() {
        if self.truckAvaible == ManipulationWhithCar.IsTruckEvaible.avaible.rawValue {
            truckAvaible = ManipulationWhithCar.IsTruckEvaible.busy.rawValue
        } else if self.truckAvaible == ManipulationWhithCar.IsTruckEvaible.busy.rawValue {
            truckAvaible = ManipulationWhithCar.IsTruckEvaible.avaible.rawValue
        }
    }
}

extension TrunkCar: IsTruckOldProtocol {
    func isTruckOld() {
        self.ageOfTrunk = 2022 - yearOfIssue
        if ageOfTrunk > 20 {
            print("Грузовик старый")
        } else {
            print("Грузовик еще не старый")
        }
    }
}

extension TrunkCar: IstruckEmptyProtocol {
    func trunkIsemty() {
        if self.isTrunkIsEmpty == ManipulationWhithCar.TruckIsEmpty.empty.rawValue {
            print("Грузовик пустой")
        } else if self.isTrunkIsEmpty == ManipulationWhithCar.TruckIsEmpty.loaded.rawValue {
            print("Грузовик загружен")
        }
    }
}

extension TrunkCar: TurnOnOfTheEngineProtocol {
    func turnOnOfTheEngine(enginework: String) {
        if enginework == "On" {
            self.enginework = ManipulationWhithCar.engineOn.mod
        } else if enginework == "Off" {
            self.enginework = ManipulationWhithCar.enigeOff.mod
        }
    }
}

// Создаем экземпляр класса спорткар
var myCar = SportCar(brand: "BMW", model: "E40", yearOfIssue: 1993, sizeOftrunkLiters: 320, sizeOfBodyMeters: 4.2, filledTrundSpace: 0)


myCar.fillTheTrunkSpace(weight: 100)
myCar.turnOnOfTheEngine(enginework: "Off")
//print(myCar)

// Создаем экземпляр класса Грузовик
var myTrunkCar = TrunkCar(brand: "Volvo", model: "F140", yearOfIssue: 1999, sizeOftrunkLiters: 20000, sizeOfBodyMeters: 12.4)

myTrunkCar.fillTheTrunkSpace(weight: 10000)
print(myTrunkCar)

myTrunkCar.whatClassIsCar()

myTrunkCar.changeStatusAvailability()
print(myTrunkCar)

myTrunkCar.isTruckOld()
myTrunkCar.trunkIsemty()
myTrunkCar.turnOnOfTheEngine(enginework: "Off")
print(myTrunkCar)
