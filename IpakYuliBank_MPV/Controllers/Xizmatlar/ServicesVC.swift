//
//  XizmatlarVC.swift
//  IpakYuliBank_MPV
//
//  Created by locky on 24/01/24.
//

import UIKit

final class ServicesVC: UIViewController {
    
    let presenter: ServicesPresenterable
    
    init() {
        self.presenter = ServicesPresenter()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var servicesView: ServicesView = {
        let v = ServicesView()
        return v
    }()
    
    override func loadView() {
        super.loadView()
        view = servicesView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Boshqa"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(searchButtonTapped))
        navigationItem.rightBarButtonItem?.tintColor = .black
        
        servicesView.serviceCollectionView.delegate = self
        servicesView.serviceCollectionView.dataSource = self
    }
    
    @objc private func searchButtonTapped(){
        
    }
}


extension ServicesVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.numberOfItemsInSection(for: 12)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        presenter.cellForItemAt(collectionView: collectionView, indexPath: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        presenter.viewForSupplementaryElementOfKind(collectionView: collectionView, indexPath: indexPath)
    }
    
    
}
