//
//  DataModel.swift
//  IpakYuliBank_MPV
//
//  Created by locky on 31/01/24.
//

import UIKit

struct DataModel {
    let bankServices: [BankServiceDM]
    let useful: [UsefulDM]
    let transactionHistory: [TransactionHistoryDM]
    let myCards: [MyCardsDM]
}

struct BankServiceDM {
    let imgName: String
    let title: String
    
    init(imgName: String, title: String) {
        self.imgName = imgName
        self.title = title
    }
}

struct UsefulDM {
    let imageName: String
    
    init(imageName: String) {
        self.imageName = imageName
    }
}

//struct FavoritesDM {
//    var imageName: String
//    
//    init(imageName: String) {
//        self.imageName = imageName
//    }
//}

struct TransactionHistoryDM {
    let date: String
    let time: String
    let howTransaction: String
    let value: String
    let currency: String
    
    init(date: String, time: String, howTransaction: String, value: String, currency: String) {
        self.date = date
        self.time = time
        self.howTransaction = howTransaction
        self.value = value
        self.currency = currency
    }
}


struct MyCardsDM {
    var name: String
    var type: String
    var value: String
    var isFavorites: Bool
    
    init(name: String, type: String, value: String, isFavorites: Bool) {
        self.name = name
        self.type = type
        self.value = value
        self.isFavorites = isFavorites
    }
}
