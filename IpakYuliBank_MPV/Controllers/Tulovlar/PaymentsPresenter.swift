//
//  PaymentsPresenter.swift
//  IpakYuliBank_MPV
//
//  Created by locky on 07/02/24.
//

import UIKit

protocol PaymentsPresenterable: AnyObject {
    func numberOfItemsInSection(for section: Int) -> Int
    func cellForItemAt(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell
    func viewForSupplementaryElementOfKind(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionReusableView
}


final class PaymentsPresenter: PaymentsPresenterable {
    
    var data1 = [
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
]
    
    func numberOfItemsInSection(for section: Int) -> Int {
        data1.count
    }
    
    func cellForItemAt(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BankServiceCvCell", for: indexPath) as! BankServiceCvCell
        cell.prepare(dm: data1[indexPath.item])
        return cell
    }
    
    func viewForSupplementaryElementOfKind(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionReusableView {
        return collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "NoHeader", for: indexPath)
    }
    
}
