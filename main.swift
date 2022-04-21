//
//  main.swift
//  Lesson 3
//
//  Created by kolosov Alexey on 20.04.2022.
//

import Foundation

enum ManipulationWhithCar {         // описание возможных действий с авто
    case engineOn, enigeOff
    case windowsClose, windowsOpen
    case carIsLocked, carIsUnLocked
    case cleanCar, dirtyCar
    case lightsOn, lightsOff
    case noNeedRepair, needToBeFixed
    case fueled, needToTunkUp
    case white, black, yellow, gray, silver, green, red

    enum IsTruckEvaible: String {   // описание действий с грузовиком
        case avaible = "Свободен", busy = "На выезде"
    }
    enum NumOfWheals: Int {         // описание действий с грузовиком
        case fourWheals = 4, eightWheals = 8
    }

    enum TruckIsEmpty: String {     // описание действий с грузовиком
        case empty = "Пустой", loaded = "Загружен"
    }

    var mod: String {     // использую данный метод, чтобы можно было добавлять значения другого типа
        switch self {     // к примеру var mod2: Int  итам перечислиб бы цифровые значения, при этом enum бы не менялся
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

struct ForSportCar {   // структура для описания спорт автомобиля
    let brand: String
    let model: String
    let yearOfIssue: Int
    var sizeOftrunkLiters: Int
    var filledTrundSpace: Int
    let sizeOfBodyMeters: Double
    var enginework = ManipulationWhithCar.engineOn.mod  // ссылаюсь на enum и mod чтобы получить сразу String
    var windowsClose = ManipulationWhithCar.windowsClose.mod
    var color = ManipulationWhithCar.white.mod
    var fuled = ManipulationWhithCar.fueled.mod
    var readyToGo = ManipulationWhithCar.noNeedRepair.mod
    var lightsOnOff = ManipulationWhithCar.lightsOn.mod
    var isCarClean = ManipulationWhithCar.cleanCar.mod
    var isCarLocked = ManipulationWhithCar.carIsUnLocked.mod


    mutating func openCloseDoors() {   // функция от обратного окрывания/ закрывания дверей
        if self.isCarLocked == ManipulationWhithCar.carIsUnLocked.mod {
            self.isCarLocked = ManipulationWhithCar.carIsLocked.mod
        } else if self.isCarLocked == ManipulationWhithCar.carIsLocked.mod {
            self.isCarLocked = ManipulationWhithCar.carIsUnLocked.mod
            }
        }
    mutating func fillTheTrunkSpace(weight: Int) {          // функция по добавлению груза в багажник, при этом
        self.filledTrundSpace = filledTrundSpace + weight   // показывает сколько места осталось и помещается ли груз
        self.sizeOftrunkLiters = sizeOftrunkLiters - filledTrundSpace
        if sizeOftrunkLiters < 0 {
            print("Груз не влазиет")
            }
        }
}

struct ForTrunck {   // структура для описания грузового автомобиля
    let brand: String
    let model: String
    let yearOfIssue: Int
    var sizeOftrunkLiters: Int
    var filledTrundSpace: Int
    let sizeOfBodyMeters: Double
    var enginework = ManipulationWhithCar.engineOn.mod
    var windowsClose = ManipulationWhithCar.windowsClose.mod
    var color = ManipulationWhithCar.white.mod
    var fuled = ManipulationWhithCar.fueled.mod
    var readyToGo = ManipulationWhithCar.noNeedRepair.mod
    var lightsOnOff = ManipulationWhithCar.lightsOn.mod
    var isCarClean = ManipulationWhithCar.cleanCar.mod
    var isCarLocked = ManipulationWhithCar.carIsUnLocked.mod
    var truckAvaible = ManipulationWhithCar.IsTruckEvaible.avaible.rawValue
    let numbOfwheals = ManipulationWhithCar.NumOfWheals.eightWheals.rawValue
    var isTrunkIsEmpty = ManipulationWhithCar.TruckIsEmpty.empty.rawValue

    mutating func changeStatusAvailability() {  // функция от обратного
        if self.truckAvaible == ManipulationWhithCar.IsTruckEvaible.avaible.rawValue {
            truckAvaible = ManipulationWhithCar.IsTruckEvaible.busy.rawValue
        } else if self.truckAvaible == ManipulationWhithCar.IsTruckEvaible.busy.rawValue {
            truckAvaible = ManipulationWhithCar.IsTruckEvaible.avaible.rawValue
    }
}

    mutating func fillTheTrunkSpace(weight: Int) {
        self.filledTrundSpace = filledTrundSpace + weight
        self.sizeOftrunkLiters = sizeOftrunkLiters - filledTrundSpace
        if sizeOftrunkLiters < 0 {
            print("Груз не влазиет")
        }
    }
}
// создаем экземпляр спорт автомобиля
// print законспектировал чтобы не было каши в консоле
var sportCar = ForSportCar(brand: "Audi", model: "Rs6", yearOfIssue: 2018, sizeOftrunkLiters: 565, filledTrundSpace: 0,
sizeOfBodyMeters: 4.853, enginework: ManipulationWhithCar.engineOn.mod, windowsClose:
ManipulationWhithCar.windowsClose.mod, color: ManipulationWhithCar.black.mod, fuled: ManipulationWhithCar.fueled.mod,
readyToGo: ManipulationWhithCar.noNeedRepair.mod, lightsOnOff: ManipulationWhithCar.lightsOff.mod, isCarClean: ManipulationWhithCar.cleanCar.mod, isCarLocked: ManipulationWhithCar.carIsUnLocked.mod)
//print(sportCar)
sportCar.openCloseDoors()
//print(sportCar)
sportCar.fillTheTrunkSpace(weight: 200)
//print(sportCar)
sportCar.fillTheTrunkSpace(weight: 500)
//print(sportCar)

// создаем экземпляр грузового автомобиля
var trunkCar = ForTrunck(brand: "Volvo", model: "FH16", yearOfIssue: 2013, sizeOftrunkLiters: 43000, filledTrundSpace: 0, sizeOfBodyMeters: 12.532)
//print(trunkCar)
trunkCar.fillTheTrunkSpace(weight: 50000)
//print(trunkCar)
trunkCar.changeStatusAvailability()
//print(trunkCar)






//Особого значения эта функция в коде не нашла, заменил ее на mod

/*
func modeOutpute(for name: ManipulationWhithCar) {
    switch name {
    case .engineOn:
        print("\(ManipulationWhithCar.engineOn.mod)")
    case .enigeOff:
        print("\(ManipulationWhithCar.enigeOff.mod)")
    case .windowsClose:
        print("\(ManipulationWhithCar.windowsClose.mod)")
    case .windowsOpen:
        print("\(ManipulationWhithCar.windowsOpen.mod)")
    case .carIsLocked:
        print("\(ManipulationWhithCar.carIsLocked.mod)")
    case .carIsUnLocked:
        print("\(ManipulationWhithCar.carIsUnLocked.mod)")
    case .cleanCar:
        print("\(ManipulationWhithCar.cleanCar.mod)")
    case .dirtyCar:
        print("\(ManipulationWhithCar.dirtyCar.mod)")
    case .lightsOn:
        print("\(ManipulationWhithCar.lightsOn.mod)")
    case .lightsOff:
        print("\(ManipulationWhithCar.lightsOff.mod)")
    case .noNeedRepair:
        print("\(ManipulationWhithCar.noNeedRepair.mod)")
    case .needToBeFixed:
        print("\(ManipulationWhithCar.needToBeFixed.mod)")
    case .fueled:
        print("\(ManipulationWhithCar.fueled.mod)")
    case .needToTunkUp:
        print("\(ManipulationWhithCar.needToTunkUp.mod)")
    case .white:
        print("\(ManipulationWhithCar.white.mod)")
    case .black:
        print("\(ManipulationWhithCar.black.mod)")
    case .yellow:
        print("\(ManipulationWhithCar.yellow.mod)")
    case .gray:
        print("\(ManipulationWhithCar.gray.mod)")
    case .silver:
        print("\(ManipulationWhithCar.silver.mod)")
    case .green:
        print("\(ManipulationWhithCar.green.mod)")
    case .red:
        print("\(ManipulationWhithCar.red.mod)")
    }
*/
