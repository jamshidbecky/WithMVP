//
//  OtherView.swift
//  IpakYuliBank_MPV
//
//  Created by locky on 31/01/24.
//

import UIKit

final class OtherView: UIView {
    
    lazy var otherCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        
        collectionView.register(TopCVCell.self, forCellWithReuseIdentifier: "OthersCvCell")
        collectionView.register(InfoHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "NoHeader")
        collectionView.register(InfoCVCell.self, forCellWithReuseIdentifier: "InfoCVCell")
        collectionView.register(SettingHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SettingHeader")
        collectionView.register(SettingCVCell.self, forCellWithReuseIdentifier: "SettingCVCell")
        
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    
    
    
    
    init(){
        super.init(frame: .zero)
        
        addSubview(otherCollectionView)
        otherCollectionView.translatesAutoresizingMaskIntoConstraints = false
        otherCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        otherCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        otherCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        otherCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        otherCollectionView.collectionViewLayout = createLayout()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
