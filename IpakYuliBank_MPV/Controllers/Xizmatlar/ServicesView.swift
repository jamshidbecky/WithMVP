//
//  ServicesView.swift
//  IpakYuliBank_MPV
//
//  Created by locky on 31/01/24.
//

import UIKit

final class ServicesView: UIView {
    
    lazy var serviceCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        
        
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    init(){
        super.init(frame: .zero)
        backgroundColor = UIColor(red: 238/255, green: 241/255, blue: 243/255, alpha: 1)
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCollectionView(){
        addSubview(serviceCollectionView)
        serviceCollectionView.translatesAutoresizingMaskIntoConstraints = false
        serviceCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 2).isActive = true
        serviceCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        serviceCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        serviceCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        serviceCollectionView.collectionViewLayout = createLayout()
        serviceCollectionView.register(InfoHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "NoHeader")
        serviceCollectionView.register(BankServiceCvCell.self, forCellWithReuseIdentifier: "BankServiceCvCell")
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (
            sectionIndex: Int,
            layoutEnvironment: NSCollectionLayoutEnvironment
        ) -> NSCollectionLayoutSection? in
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3),
                                                  heightDimension: .fractionalHeight(1))
            
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            item.contentInsets = .init(top: 5, leading: 5, bottom: 5, trailing: 5)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                   heightDimension: .fractionalWidth(1/3))
            
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            
            
            
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
            
            section.boundarySupplementaryItems = []
                        
            return section
        }
        return layout
    }
    
    
}
