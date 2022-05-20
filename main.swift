//
//  main.swift
//  Lesson 7
//
//created by Kolosov Alexey 20.05.2020

import Foundation


//Программа Постомата (Выдача посылок)

// Реализация в двух вариантах с проверкой через nil  и с выводом ошибкок через протокол Error

// Идея программы в том, что есть словать(наш постамат) по определенному ключу находится посылка
// если данные из .value введены вверно, то человек получает посылку, либо выдает ошибку


//Функция генерации случайного кода проверки ячейки
func randomString(length: Int) -> String {
    let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    return String((0..<length).map{ _ in letters.randomElement()! })
}

var randomNumberCreator = randomString(length: 15)

//print(randomNumberCreator)
//MARK: - Postomat cells

struct Parsel {
    let daysOfStorage: Int?
    let needToPay: Bool?
    let noOfPostal: String?
    let nameOfRecipient: String?
    let nameOfCell: NoOfCells
}
struct NoOfCells {
    let name: String
}
//MARK: - Postmat
final class Postamat {
    var postamatCellsFilling = [
        "Cell1": Parsel(daysOfStorage: 1,
                        needToPay: false,
                        noOfPostal: "tbzvoJHSQYG9Hjp",
                        nameOfRecipient: "Vasilii Koval",
                        nameOfCell: NoOfCells(name: "Cell1")),
        "Cell2": Parsel(daysOfStorage: nil,
                        needToPay: nil,
                        noOfPostal: nil,
                        nameOfRecipient: nil,
                        nameOfCell: NoOfCells(name: "Cell2")),
        "Cell3": Parsel(daysOfStorage: nil,
                        needToPay: nil,
                        noOfPostal: nil,
                        nameOfRecipient: nil,
                        nameOfCell: NoOfCells(name: "Cell3")),
        "Cell4": Parsel(daysOfStorage: 1,
                        needToPay: true,
                        noOfPostal: "5MB4gnXe9nlvLbi",
                        nameOfRecipient: "John Week",
                        nameOfCell: NoOfCells(name: "Cell4")),
        "Cell5": Parsel(daysOfStorage: 3,
                        needToPay: false,
                        noOfPostal: "QnziTAfmLrrRxky",
                        nameOfRecipient: "Silvester Stalone",
                        nameOfCell: NoOfCells(name: "Cell5")),
        "Cell6": Parsel(daysOfStorage: 2,
                        needToPay: true,
                        noOfPostal: "cPK2TDVuweMd1J7",
                        nameOfRecipient: "Alla Pugacheva",
                        nameOfCell: NoOfCells(name: "Cell6")),
        "Cell7": Parsel(daysOfStorage: nil,
                        needToPay: nil,
                        noOfPostal: nil,
                        nameOfRecipient: nil,
                        nameOfCell: NoOfCells(name: "Cell7")),
        "Cell8": Parsel(daysOfStorage: 1,
                        needToPay: false,
                        noOfPostal: "Y3ZMCj5MSPLGV0B",
                        nameOfRecipient: "Evgenij Strij",
                        nameOfCell: NoOfCells(name: "Cell8")),
        "Cell9": Parsel(daysOfStorage: 2,
                        needToPay: true,
                        noOfPostal: "OzRuGh6xofeH6AI",
                        nameOfRecipient: "Djeck Vorobej",
                        nameOfCell: NoOfCells(name: "Cell9")),
        "Cell10": Parsel(daysOfStorage: nil,
                         needToPay: nil,
                         noOfPostal: nil,
                         nameOfRecipient: nil,
                         nameOfCell: NoOfCells(name: "Cell10"))]

//MARK: - Func take parcel
// Т.к ячеек 10 штук прогоняю код 10 раз чтобы попасть на нужную ячейку, либо вывести ошибку
    func takeParcel(yourName: String, numberOfParcel: String) -> Parsel? {
        for cells in postamatCellsFilling.keys {  // одна ячейка из 10 (сразу 10 не хочет проверять)
            var i = 0
            repeat {
                if yourName == postamatCellsFilling[cells]?.nameOfRecipient,
                   numberOfParcel == postamatCellsFilling[cells]?.noOfPostal,
                   postamatCellsFilling[cells]?.needToPay == false,
                   postamatCellsFilling[cells]?.daysOfStorage != nil {
                    print("""
                        Возьмите вашу посылку из ячейки \(cells)

                        Закройте за собой ячейку \(cells)

                        Информация о вашей посылке:

                        """)

                    return postamatCellsFilling[cells]

                } else {
                    //print("Eror")
                    i += 1
                }
            } while i <= 10

        }
        print("Какая-то Ошибка")
        return nil
    }
}

//var postamat = Postamat()
//print(postamat.takeParcel(yourName: "Vasilii Koval", numberOfParcel: "tbzvoJHSQYG9Hjp") ?? "")
//print(postamat)


//______________________________________________________

// Делаем тоже самое, но используем протокол ERROR

enum PostalErrors: LocalizedError {
    case numberNotCorrect
    case storageDaysEnd
    case parselNotPaied
    case nameDoesNotExist
    case cellDoesNotExist


    var errorDescription: String? {
        switch self {
        case .numberNotCorrect:
            return "Номер введен неверно"
        case .storageDaysEnd:
            return "Срок хранения истек"
        case .parselNotPaied:
            return "Посылка не оплачена"
        case .nameDoesNotExist:
            return "Имя не найдено"
        case .cellDoesNotExist:
            return "Ячейки с таким номером не существует"
        }
    }
}

final class PostamatWithErrors {
    var postamatCellsFilling = [
        "Cell1": Parsel(daysOfStorage: 1,
                        needToPay: false,
                        noOfPostal: "tbzvoJHSQYG9Hjp",
                        nameOfRecipient: "Vasilii Koval",
                        nameOfCell: NoOfCells(name: "Cell1")),
        "Cell2": Parsel(daysOfStorage: nil,
                        needToPay: nil,
                        noOfPostal: nil,
                        nameOfRecipient: nil,
                        nameOfCell: NoOfCells(name: "Cell2")),
        "Cell3": Parsel(daysOfStorage: nil,
                        needToPay: nil,
                        noOfPostal: nil,
                        nameOfRecipient: nil,
                        nameOfCell: NoOfCells(name: "Cell3")),
        "Cell4": Parsel(daysOfStorage: 1,
                        needToPay: true,
                        noOfPostal: "5MB4gnXe9nlvLbi",
                        nameOfRecipient: "John Week",
                        nameOfCell: NoOfCells(name: "Cell4")),
        "Cell5": Parsel(daysOfStorage: 3,
                        needToPay: true,
                        noOfPostal: "QnziTAfmLrrRxky",
                        nameOfRecipient: "Silvester Stalone",
                        nameOfCell: NoOfCells(name: "Cell5")),
        "Cell6": Parsel(daysOfStorage: 2,
                        needToPay: true,
                        noOfPostal: "cPK2TDVuweMd1J7",
                        nameOfRecipient: "Alla Pugacheva",
                        nameOfCell: NoOfCells(name: "Cell6")),
        "Cell7": Parsel(daysOfStorage: nil,
                        needToPay: nil,
                        noOfPostal: nil,
                        nameOfRecipient: nil,
                        nameOfCell: NoOfCells(name: "Cell7")),
        "Cell8": Parsel(daysOfStorage: 1,
                        needToPay: false,
                        noOfPostal: "Y3ZMCj5MSPLGV0B",
                        nameOfRecipient: "Evgenij Strij",
                        nameOfCell: NoOfCells(name: "Cell8")),
        "Cell9": Parsel(daysOfStorage: 2,
                        needToPay: true,
                        noOfPostal: "OzRuGh6xofeH6AI",
                        nameOfRecipient: "Djeck Vorobej",
                        nameOfCell: NoOfCells(name: "Cell9")),
        "Cell10": Parsel(daysOfStorage: nil,
                         needToPay: nil,
                         noOfPostal: nil,
                         nameOfRecipient: nil,
                         nameOfCell: NoOfCells(name: "Cell10"))]


//MARK: - Func take parcel with errors
    //в данном варианте проверки 10 раз нет, т.к ввел проверку по ключу, если ключ удолетворяет требованиям,
    // то идет дальнейшая проверка
    func takeParcel2(yourName: String, numberOfParcel: String, cellName: String) throws -> Parsel {

        guard postamatCellsFilling[cellName] != nil else
        {throw PostalErrors.cellDoesNotExist}
        guard yourName == postamatCellsFilling[cellName]?.nameOfRecipient else
        {throw PostalErrors.nameDoesNotExist}
        guard numberOfParcel == postamatCellsFilling[cellName]?.noOfPostal else
        {throw PostalErrors.numberNotCorrect}
        guard postamatCellsFilling[cellName]?.needToPay == false else
        {throw PostalErrors.parselNotPaied}
        guard postamatCellsFilling[cellName]?.daysOfStorage != nil else
        {throw PostalErrors.storageDaysEnd}

        let newItem =  postamatCellsFilling[cellName]!

        print("""
            Возьмите вашу посылку из ячейки \(cellName)

            Закройте за собой ячейку \(cellName)

            Информация о вашей посылке:

            """)
        return newItem
    }
}


let postalCorrect = PostamatWithErrors()
let postalWithError = PostamatWithErrors()

// Выводим результат с выводом ошибок через do try/catch
do {
    try print(postalCorrect.takeParcel2(yourName: "Vasilii Koval", numberOfParcel: "tbzvoJHSQYG9Hjp", cellName: "Cell1"))
    try print(postalWithError.takeParcel2(yourName: "Silvester Stalone", numberOfParcel: "QnziTAfmLrrRxky", cellName: "Cell5"))
} catch let error{
    print("\(error.localizedDescription)")

}

