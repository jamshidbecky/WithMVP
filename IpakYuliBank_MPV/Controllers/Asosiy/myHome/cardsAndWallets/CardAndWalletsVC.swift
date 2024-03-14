//
//  CardAndWalletsVC.swift
//  IpakYuliBank_MPV
//
//  Created by locky on 12/02/24.
//

import UIKit
import SnapKit

final class CardAndWalletsVC: UIViewController {
    
    private lazy var segmentControl: UISegmentedControl = {
        let sc = UISegmentedControl()
        return sc
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    private var squareBoolValue = true
    private var imageSquare = UIImage(systemName: "square.split.1x2")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        collectionView.collectionViewLayout = createLayout()
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    private func initUI() {
        view.backgroundColor = .white
        title = "Kartalar va hamyonlar"
        
        var plusBtn = UIBarButtonItem(
            image: UIImage(systemName: "plus.circle.fill"),
            style: .done, target: self,
            action: #selector(plusButtonTapped)
        )
        
        var squareBtn = UIBarButtonItem(
            image: imageSquare,
            style: .done, target: self,
            action: #selector(squareButtonTapped)
        )
        plusBtn.tintColor = UIColor(named: "mainColor")
        squareBtn.tintColor = .black
        navigationItem.rightBarButtonItems = [plusBtn, squareBtn]
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { [self] (
            sectionIndex: Int,
            layoutEnvironment: NSCollectionLayoutEnvironment
        ) -> NSCollectionLayoutSection? in
            
            let section: NSCollectionLayoutSection
            
            if squareBoolValue {
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)
                )
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = .init(top: 5, leading: 5, bottom: 5, trailing: 5)
                
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalWidth(3/5))
                
                let group: NSCollectionLayoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                section = NSCollectionLayoutSection(group: group)
                
            } else {
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)
                )
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = .init(top: 5, leading: 5, bottom: 5, trailing: 5)
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalWidth(1/5))
                
                let group: NSCollectionLayoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                section = NSCollectionLayoutSection(group: group)
            }
            
            return section
            
        }
        return layout
    }
    
    @objc private func plusButtonTapped() {
        print("ok1")
    }
    
    @objc private func squareButtonTapped() {
        squareBoolValue.toggle()
        if squareBoolValue {
            imageSquare = UIImage(systemName: "square.split.2x2")
            navigationItem.rightBarButtonItems?[1].image = imageSquare
        } else {
            imageSquare = UIImage(systemName: "square.split.1x2")
            navigationItem.rightBarButtonItems?[1].image = imageSquare

        }
        collectionView.reloadData()
    }
}


extension CardAndWalletsVC: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
}
