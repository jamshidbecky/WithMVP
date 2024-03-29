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
    
    let presenter: OtherPresenterable
    
    init() {
        self.presenter = OtherPresenter()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let otherView = OtherView()
    
    override func loadView() {
        super.loadView()
        view = otherView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Boshqa"
        view.backgroundColor = .systemGray6
        
        otherView.otherCollectionView.delegate = self
        otherView.otherCollectionView.dataSource = self
    }
    
}


extension OtherVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        OtherSectionType.allCases.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.numberOfItemsInSection(for: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        presenter.cellForItemAt(collectionView: collectionView, indexPath: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        presenter.viewForSupplementaryElementOfKind(collectionView: collectionView, indexPath: indexPath)
    }
}
