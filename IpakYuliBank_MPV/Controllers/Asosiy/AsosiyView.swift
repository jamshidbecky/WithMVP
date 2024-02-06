//
//  AsosiyView.swift
//  IpakYuliBank_MPV
//
//  Created by locky on 24/01/24.
//

import UIKit

let windowWidth = UIScreen.main.bounds.width
let windowHeight = UIScreen.main.bounds.height

final class AsosiyView: UIView {
    
    var asosiyCollectionView: UICollectionView = {
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        //MARK: -> myHomeSection
        collectionView.register(MyHomeHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "MyHomeHeader")
        collectionView.register(MyHomeCvCell.self, forCellWithReuseIdentifier: "MyHomeCvCell")
        //MARK: -> bankServiceSection
        collectionView.register(BankServiceHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "BankServiceHeader")
        collectionView.register(BankServiceCvCell.self, forCellWithReuseIdentifier: "BankServiceCvCell")
        //MARK: -> phoneNumberSection
        collectionView.register(PhoneNumberHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "PhoneNumberHeader")
        collectionView.register(PhoneNumberCvCell.self, forCellWithReuseIdentifier: "PhoneNumberCvCell")
        //MARK: -> phoneNumberSection
        collectionView.register(UsefulHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "UsefulHeader")
        collectionView.register(UsefulCvCell.self, forCellWithReuseIdentifier: "UsefulCvCell")
        //MARK: -> favoritesSection
        collectionView.register(FavoritesHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "FavoritesHeader")
        collectionView.register(FavoritesCvCell.self, forCellWithReuseIdentifier: "FavoritesCvCell")
        //MARK: -> transactionSection
        collectionView.register(TransactionHistoryHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "TransactionHistoryHeader")
        collectionView.register(TransactionHistoryCvCell.self, forCellWithReuseIdentifier: "TransactionHistoryCvCell")
        //MARK: -> myCardsSection
        collectionView.register(MyCardsHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "MyCardsHeader")
        collectionView.register(MyCardsCvCell.self, forCellWithReuseIdentifier: "MyCardsCvCell")
        return collectionView
    }()
    
    private lazy var backImage: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.image = UIImage(named: "backgroundImage")
        return img
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        initBackgroundImage()
        initCollectionView()
    }
    
    
    //MARK: -> initBackgroundImage
    private func initBackgroundImage() {
        addSubview(backImage)
        backImage.translatesAutoresizingMaskIntoConstraints = false
        backImage.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        backImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        backImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        backImage.heightAnchor.constraint(equalTo: backImage.widthAnchor, multiplier: 1.0).isActive = true
    }
    
    //MARK: -> initCollectionView
    private func initCollectionView() {
        asosiyCollectionView.collectionViewLayout = createLayout()
        addSubview(asosiyCollectionView)
        asosiyCollectionView.translatesAutoresizingMaskIntoConstraints = false
        asosiyCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        asosiyCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        asosiyCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        asosiyCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (
            sectionIndex: Int,
            layoutEnvironment: NSCollectionLayoutEnvironment
        ) -> NSCollectionLayoutSection? in
            
            let section: NSCollectionLayoutSection
            
            guard let index = SectionType(rawValue: sectionIndex) else { return nil }
            switch index {
            case .myHome:
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)
                )
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalWidth(2/5))
                
                let group: NSCollectionLayoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                section = NSCollectionLayoutSection(group: group)

                
                let headerSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalWidth(3/5)
                )
                
                let header = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: headerSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )
                section.boundarySupplementaryItems = [header]
            case .bankServices:
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1/3),
                    heightDimension: .fractionalHeight(1)
                )
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = .init(top: 5, leading: 5, bottom: 5, trailing: 5)
                
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalWidth(1/3))
                
                let group: NSCollectionLayoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                section = NSCollectionLayoutSection(group: group)

                section.orthogonalScrollingBehavior = .continuous
                
                let headerSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .absolute(37)
                )
                
                let header = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: headerSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )
                
                section.contentInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
                section.boundarySupplementaryItems = [header]
                
                let backgroundDecoretion = NSCollectionLayoutDecorationItem.background(elementKind: "BackgroundColor")
                backgroundDecoretion.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
                backgroundDecoretion.zIndex = -1
                section.decorationItems = [backgroundDecoretion]
            case .phoneNumber:
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)
                )
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .absolute(52))
                
                let group: NSCollectionLayoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                section = NSCollectionLayoutSection(group: group)

                
                let headerSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .absolute(35)
                )
                
                let header = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: headerSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )
                section.contentInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
                section.boundarySupplementaryItems = [header]
                
                let backgroundDecoretion = NSCollectionLayoutDecorationItem.background(elementKind: "BackgroundColor")
                backgroundDecoretion.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
                backgroundDecoretion.zIndex = -1
                section.decorationItems = [backgroundDecoretion]
            case .useful:
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)
                )
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .absolute(windowWidth - 30),
                    heightDimension: .absolute(62))
                
                let group: NSCollectionLayoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                group.contentInsets = .init(top: 0, leading: 5, bottom: 0, trailing: 5)
                section = NSCollectionLayoutSection(group: group)

                
                let headerSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .absolute(45)
                )
                
                let header = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: headerSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )
                section.orthogonalScrollingBehavior = .groupPagingCentered
                section.contentInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
                section.boundarySupplementaryItems = [header]
                
                let backgroundDecoretion = NSCollectionLayoutDecorationItem.background(elementKind: "BackgroundColor")
                backgroundDecoretion.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
                backgroundDecoretion.zIndex = -1
                section.decorationItems = [backgroundDecoretion]
            case .favorites:
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1/3),
                    heightDimension: .fractionalHeight(1)
                )
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = .init(top: 5, leading: 5, bottom: 5, trailing: 5)
                
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalWidth(1/3))
                
                let group: NSCollectionLayoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                section = NSCollectionLayoutSection(group: group)

                section.orthogonalScrollingBehavior = .continuous
                
                let headerSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .absolute(37)
                )
                
                let header = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: headerSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )
                section.contentInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
                section.boundarySupplementaryItems = [header]
                
                let backgroundDecoretion = NSCollectionLayoutDecorationItem.background(elementKind: "BackgroundColor")
                backgroundDecoretion.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
                backgroundDecoretion.zIndex = -1
                section.decorationItems = [backgroundDecoretion]
            case .transactionHistory:
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)
                )
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .absolute(70))
                
                let group: NSCollectionLayoutGroup = NSCollectionLayoutGroup.horizontal(
                    layoutSize: groupSize, subitems: [item]
                )
                
                group.contentInsets = .init(top: 5, leading: 5, bottom: 5, trailing: 5)
                
                section = NSCollectionLayoutSection(group: group)

                
                let headerSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .absolute(45)
                )
                
                let header = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: headerSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )

                section.contentInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
                section.boundarySupplementaryItems = [header]
                
                let backgroundDecoretion = NSCollectionLayoutDecorationItem.background(elementKind: "BackgroundColor")
                backgroundDecoretion.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
                backgroundDecoretion.zIndex = -1
                section.decorationItems = [backgroundDecoretion]
            case .myCards:
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)
                )
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .absolute(windowWidth - 30),
                    heightDimension: .absolute(80))
                
                let group: NSCollectionLayoutGroup = NSCollectionLayoutGroup.horizontal(
                    layoutSize: groupSize, subitems: [item]
                )
                
                group.contentInsets = .init(top: 5, leading: 5, bottom: 5, trailing: 5)
                
                section = NSCollectionLayoutSection(group: group)

                
                let headerSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .absolute(45)
                )
                
                let header = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: headerSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
                section.boundarySupplementaryItems = [header]
                
                let backgroundDecoretion = NSCollectionLayoutDecorationItem.background(elementKind: "BackgroundColor")
                backgroundDecoretion.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
                backgroundDecoretion.zIndex = -1
                section.decorationItems = [backgroundDecoretion]
            }
            
            return section
            
        }
        layout.register(BackgroundColor.self, forDecorationViewOfKind: "BackgroundColor")
        return layout
    }
    
    
    
}
