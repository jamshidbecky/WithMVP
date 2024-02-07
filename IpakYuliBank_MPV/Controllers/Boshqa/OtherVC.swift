//
//  BoshqaVC.swift
//  IpakYuliBank_MPV
//
//  Created by locky on 24/01/24.
//

import UIKit

enum OtherSectionType: Int, CaseIterable {
    case top
    case info
    case setting
}


final class OtherVC: UIViewController {
    
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
    
        
    private lazy var otherCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
    
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(TopCVCell.self, forCellWithReuseIdentifier: "OthersCvCell")
        collectionView.register(InfoHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "NoHeader")
        collectionView.register(InfoCVCell.self, forCellWithReuseIdentifier: "InfoCVCell")
        collectionView.register(SettingHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SettingHeader")
        collectionView.register(SettingCVCell.self, forCellWithReuseIdentifier: "SettingCVCell")
        
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Boshqa"
        navigationItem.titleView?.backgroundColor = .white
        view.backgroundColor = .systemGray6
        
        view.addSubview(otherCollectionView)
        otherCollectionView.translatesAutoresizingMaskIntoConstraints = false
        otherCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        otherCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        otherCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        otherCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        
        otherCollectionView.collectionViewLayout = createLayout()
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (
            sectionIndex: Int,
            layoutEnvironment: NSCollectionLayoutEnvironment
        ) -> NSCollectionLayoutSection? in
            
            var section: NSCollectionLayoutSection
            
            guard let index = OtherSectionType(rawValue: sectionIndex) else { return nil }
            switch index {
            case .top:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                       heightDimension: .absolute(64))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                section = NSCollectionLayoutSection(group: group)
                
                section.interGroupSpacing = 10
                
                group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
                
                section.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15)
                            
                let backgroundDecoretion = NSCollectionLayoutDecorationItem.background(elementKind: "BackgroundColor")
                backgroundDecoretion.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
                backgroundDecoretion.zIndex = -1
                section.decorationItems = [backgroundDecoretion]
            case .info:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                       heightDimension: .absolute(64))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                section = NSCollectionLayoutSection(group: group)
                
                section.interGroupSpacing = 10
                
                group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
                
                section.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15)
                let headerSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .absolute(60)
                )
                
                let header = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: headerSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)
                section.boundarySupplementaryItems = [header]
            case .setting:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                       heightDimension: .absolute(64))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                section = NSCollectionLayoutSection(group: group)
                
                section.interGroupSpacing = 10
                
                group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
                
                section.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15)
                let headerSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .absolute(60)
                )
                
                let header = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: headerSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)
                section.boundarySupplementaryItems = [header]
            }
                    
            return section
        }
        layout.register(BackgroundColor.self, forDecorationViewOfKind: "BackgroundColor")
        return layout
    }
}


extension OtherVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        OtherSectionType.allCases.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let otherSectionType = OtherSectionType(rawValue: section) else { return 0 }
        
        switch otherSectionType {
        case .top: return datas[0].top.count
        case .info: return datas[0].info.count
        case .setting: return datas[0].setting.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
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
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
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
