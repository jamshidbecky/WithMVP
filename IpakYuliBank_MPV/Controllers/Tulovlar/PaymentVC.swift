//
//  PaymentVC.swift
//  IpakYuliBank_MPV
//
//  Created by locky on 07/02/24.
//

import UIKit

final class PaymentVC: UIViewController {
    
    let presenter: PaymentsPresenterable
    
    init() {
        self.presenter = PaymentsPresenter()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var paymentsView: PaymentsView = {
        let v = PaymentsView()
        return v
    }()
    
    override func loadView() {
        super.loadView()
        view = paymentsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "To'lovlar"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(searchButtonTapped))
        navigationItem.rightBarButtonItem?.tintColor = .black
        
        paymentsView.paymentsCollectionView.delegate = self
        paymentsView.paymentsCollectionView.dataSource = self
    }
    
    @objc private func searchButtonTapped(){
        
    }
}


extension PaymentVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
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
