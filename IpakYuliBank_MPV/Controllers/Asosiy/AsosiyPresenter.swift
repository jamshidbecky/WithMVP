//
//  AsosiyPresenter.swift
//  IpakYuliBank_MPV
//
//  Created by locky on 30/01/24.
//

import UIKit

protocol AsosiyPresenterable: AnyObject {
    func numberOfItemsInSection(for section: Int) -> Int
    func cellForItemAt(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell
    func viewForSupplementaryElementOfKind(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionReusableView
}

final class AsosiyPresenter: AsosiyPresenterable {
    
    var datas = DataModel(
        bankServices: [
            BankServiceDM(imgName: "pencil.circle", title: "Kartaga o'tkazish"),
            BankServiceDM(imgName: "folder.badge.minus", title: "MoneySend"),
            BankServiceDM(imgName: "trash", title: "Money Express o'tkazmalari"),
            BankServiceDM(imgName: "doc.text", title: "Westren Union"),
            BankServiceDM(imgName: "apple.terminal", title: "Zolotaya Korona"),
            BankServiceDM(imgName: "book.closed", title: "Naqd pul yechib olish"),
            BankServiceDM(imgName: "graduationcap", title: "VISA Direct o'tkazmalari"),
            BankServiceDM(imgName: "creditcard", title: "Kartani buyurtma qilish"),
            BankServiceDM(imgName: "lanyardcard", title: "Kartani qo'shish"),
            BankServiceDM(imgName: "sportscourt", title: "Kredit olish")
    ],
            useful: [
                UsefulDM(imageName: "w1"),
            UsefulDM(imageName: "w2"),
            UsefulDM(imageName: "w3"),
            UsefulDM(imageName: "w4"),
            UsefulDM(imageName: "w5"),
            UsefulDM(imageName: "w6"),
            UsefulDM(imageName: "w7"),
            UsefulDM(imageName: "w8"),
            UsefulDM(imageName: "w9"),
            
        ],
        transactionHistory: [
            TransactionHistoryDM(date: "27 yanvar", time: "19:00", howTransaction: "O'tkazma", value: "500 UZS", currency: "UZS"),
            TransactionHistoryDM(date: "27 yanvar", time: "19:00", howTransaction: "O'tkazma", value: "500 UZS", currency: "UZS"),
            TransactionHistoryDM(date: "27 yanvar", time: "19:00", howTransaction: "O'tkazma", value: "500 UZS", currency: "UZS"),
            TransactionHistoryDM(date: "27 yanvar", time: "19:00", howTransaction: "O'tkazma", value: "500 UZS", currency: "UZS"),
            TransactionHistoryDM(date: "27 yanvar", time: "19:00", howTransaction: "O'tkazma", value: "500 UZS", currency: "UZS"),
            TransactionHistoryDM(date: "27 yanvar", time: "19:00", howTransaction: "O'tkazma", value: "500 UZS", currency: "UZS"),
            TransactionHistoryDM(date: "27 yanvar", time: "19:00", howTransaction: "O'tkazma", value: "500 UZS", currency: "UZS"),
            TransactionHistoryDM(date: "27 yanvar", time: "19:00", howTransaction: "O'tkazma", value: "500 UZS", currency: "UZS"),
            TransactionHistoryDM(date: "27 yanvar", time: "19:00", howTransaction: "O'tkazma", value: "500 UZS", currency: "UZS"),
    ], myCards: [
        MyCardsDM(name: "KHAYDAROV KHONDAMIR", type: "HUMO", value: "0.17 UZS", isFavorites: true),
        MyCardsDM(name: "KHAYDAROV JAMSHIDBEK", type: "UZCARD", value: "0.17 UZS", isFavorites: true),
        MyCardsDM(name: "KHAYDAROV KHONDAMIR", type: "HUMO", value: "0.17 UZS", isFavorites: true)
    ])
    
    func numberOfItemsInSection(for section: Int) -> Int {
        guard let sectionType = SectionType(rawValue: section) else { return 0 }
        switch sectionType {
            case .myHome: return 1
        case .bankServices: return datas.bankServices.count
            case .phoneNumber: return 1
        case .useful: return datas.useful.count
            case .favorites: return 1
        case .transactionHistory: return datas.transactionHistory.count
        case .myCards: return datas.myCards.count
        }
    }
    
    func cellForItemAt(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        guard let sectionType = SectionType(rawValue: indexPath.section) else { return UICollectionViewCell() }
        
        switch sectionType {
        case .myHome:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyHomeCvCell", for: indexPath) as! MyHomeCvCell
            return cell
        case .bankServices:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BankServiceCvCell", for: indexPath) as! BankServiceCvCell
            cell.prepare(dm: datas.bankServices[indexPath.item])
            return cell
        case .phoneNumber:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhoneNumberCvCell", for: indexPath) as! PhoneNumberCvCell
            return cell
        case .useful:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UsefulCvCell", for: indexPath) as! UsefulCvCell
            cell.prepare(dm: datas.useful[indexPath.item])
            return cell
        case .favorites:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoritesCvCell", for: indexPath) as! FavoritesCvCell
            return cell
        case .transactionHistory:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TransactionHistoryCvCell", for: indexPath) as! TransactionHistoryCvCell
            cell.prepare(dm: datas.transactionHistory[indexPath.item])
            return cell
        case .myCards:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCardsCvCell", for: indexPath) as! MyCardsCvCell
            cell.prepare(dm: datas.myCards[indexPath.item])
            return cell
        }
    }
    
    func viewForSupplementaryElementOfKind(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionReusableView {
        guard let sectionType = SectionType(rawValue: indexPath.section) else { return UICollectionReusableView() }

        switch sectionType {
        case .myHome:
            return collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "MyHomeHeader", for: indexPath)
        case .bankServices:
            return collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "BankServiceHeader", for: indexPath)
        case .phoneNumber:
            return collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "PhoneNumberHeader", for: indexPath)
        case .useful:
            return collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "UsefulHeader", for: indexPath)
        case .favorites:
            return collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "FavoritesHeader", for: indexPath)
        case .transactionHistory:
            return collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "TransactionHistoryHeader", for: indexPath)
        case .myCards:
            return collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "MyCardsHeader", for: indexPath)
        }
    }
    
    
}

