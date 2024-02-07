//
//  PaymentsView.swift
//  IpakYuliBank_MPV
//
//  Created by locky on 07/02/24.
//

import UIKit

final class PaymentsView: UIView {
    
    lazy var paymentsCollectionView: UICollectionView = {
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
        addSubview(paymentsCollectionView)
        paymentsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        paymentsCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 2).isActive = true
        paymentsCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        paymentsCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        paymentsCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        paymentsCollectionView.collectionViewLayout = createLayout()
        paymentsCollectionView.register(InfoHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "NoHeader")
        paymentsCollectionView.register(BankServiceCvCell.self, forCellWithReuseIdentifier: "BankServiceCvCell")
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
            
            let layout = UICollectionViewCompositionalLayout(section: section)
            
            return section
        }
        return layout
    }
    
    
}
