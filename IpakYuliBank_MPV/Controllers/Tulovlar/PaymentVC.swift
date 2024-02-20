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
    
    private let customNavigationBar: UIView = .init(
        frame: CGRect(x: 330, y: 0, width: 0, height: 44)
    )
    
    private let searchTF: UITextField = PaddingTextField()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
//        title = "To'lovlar"
        navigationItem.titleView = customNavigationBar
        customNavigationBar.addSubview(searchTF)
        searchTF.translatesAutoresizingMaskIntoConstraints = false
        searchTF.topAnchor.constraint(equalTo: customNavigationBar.topAnchor).isActive = true
        searchTF.leadingAnchor.constraint(equalTo: customNavigationBar.leadingAnchor).isActive = true
        searchTF.trailingAnchor.constraint(equalTo: customNavigationBar.trailingAnchor).isActive = true
        searchTF.bottomAnchor.constraint(equalTo: customNavigationBar.bottomAnchor).isActive = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(searchButtonTapped))
        navigationItem.rightBarButtonItem?.tintColor = .black
        
        paymentsView.paymentsCollectionView.delegate = self
        paymentsView.paymentsCollectionView.dataSource = self
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        customNavigationBar.frame = .init(x: 0, y: 330, width: 0, height: 44)
        customNavigationBar.backgroundColor = .clear
    }
    
    @objc private func searchButtonTapped(){
        UIView.animate(withDuration: 0.7, animations: { [self] in
            customNavigationBar.frame = .init(x: 0, y: 0, width: 330, height: 44)
            customNavigationBar.backgroundColor = .gray.withAlphaComponent(0.5)
        })
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
