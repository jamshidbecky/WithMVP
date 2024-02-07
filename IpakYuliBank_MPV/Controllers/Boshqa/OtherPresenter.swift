//
//  OtherPresenter.swift
//  IpakYuliBank_MPV
//
//  Created by locky on 31/01/24.
//

import UIKit

protocol OtherPresenterable: AnyObject {
    func numberOfItemsInSection(for section: Int) -> Int
    func cellForItemAt(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell
    func viewForSupplementaryElementOfKind(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionReusableView
}

final class OtherPresenter: OtherPresenterable {
    
    private let datas: [OtherVCDataModel] = [
        .init(top: [
            TopDM(imgName: "basket", title: "Qayta qo'ng'iroq"),
            TopDM(imgName: "bag", title: "Online chat"),
            TopDM(imgName: "centsign.arrow.circlepath", title: "Mening arizalarim")
        ], info: [
            InfoDM(imgName: "hands.clap", title: "Bizning filiallarimiz"),
            InfoDM(imgName: "brain", title: "Ommaviy oferta"),
            InfoDM(imgName: "bed.double.circle", title: "Ilova haqida"),
            InfoDM(imgName: "waveform.path.ecg", title: "Ilovadagi yangiliklar")
        ], setting: [
            SettingDM(imgName: "number.circle", title: "Til"),
            SettingDM(imgName: "minus.circle", title: "Xavfsizlik sozlamalari"),
            SettingDM(imgName: "text.justify", title: "Mavzu"),
            SettingDM(imgName: "character.textbox", title: "Fonni o'zgartirish"),
            SettingDM(imgName: "character.duployan", title: "Ilovani ulashish"),
            SettingDM(imgName: "chart.bar", title: "Keshni tozalash")
        ])
    ]
    
    func numberOfItemsInSection(for section: Int) -> Int {
        guard let otherSectionType = OtherSectionType(rawValue: section) else { return 0 }
        
        switch otherSectionType {
        case .top: return datas[0].top.count
        case .info: return datas[0].info.count
        case .setting: return datas[0].setting.count
        }
    }
    
    func cellForItemAt(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        guard let otherSectionType = OtherSectionType(rawValue: indexPath.section) else { return UICollectionViewCell() }
        
        switch otherSectionType {
        case .top:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OthersCvCell", for: indexPath) as! TopCVCell
            cell.prepare(dm: datas[0].top[indexPath.item])
            return cell
        case .info:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InfoCVCell", for: indexPath) as! InfoCVCell
            cell.prepare(dm: datas[0].info[indexPath.item])
            return cell
        case .setting:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SettingCVCell", for: indexPath) as! SettingCVCell
            cell.prepare(dm: datas[0].setting[indexPath.item])
            return cell
        }
    }
    
    func viewForSupplementaryElementOfKind(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionReusableView {
        guard let otherSectionType = OtherSectionType(rawValue: indexPath.section) else { return UICollectionReusableView() }
        
        switch otherSectionType {
        case .top:
            return UICollectionReusableView()
        case .info:
            return collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "NoHeader", for: indexPath)
        case .setting:
            return collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SettingHeader", for: indexPath)
        }
    }
}
