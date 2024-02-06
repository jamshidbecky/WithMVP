//
//  AsosiyVC.swift
//  IpakYuliBank_MPV
//
//  Created by locky on 24/01/24.
//

import UIKit

enum SectionType: Int, CaseIterable {
    case myHome
    case bankServices
    case phoneNumber
    case useful
    case favorites
    case transactionHistory
    case myCards
//    case myValue
//    case settingWidget
}

final class AsosiyVC: UIViewController {
    
    let presenter: AsosiyPresenterable
    
    init() {
        self.presenter = AsosiyPresenter()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private lazy var mainView: AsosiyView = {
        let v = AsosiyView()
        return v
    }()
    
    private let customNavigationBar: UIView = .init(
        frame: CGRect(x: 0, y: 0, width: 278, height: 44)
    )
    
    let searchTF: UITextField = PaddingTextField()
    let searchButtton = UIButton(type: .system)
    
    private lazy var refreshControl: UIRefreshControl = {
        let rC = UIRefreshControl()
        return rC
    }()
    
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initNavigation()
        mainView.asosiyCollectionView.delegate = self
        mainView.asosiyCollectionView.dataSource = self
        
        refreshControl.tintColor = .white
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        mainView.asosiyCollectionView.refreshControl = refreshControl
        
        
    }
    
    private func initNavigation() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "person"),
            style: .plain,
            target: self,
            action: #selector(leftButtonTapped)
        )
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "bell"),
            style: .plain,
            target: self,
            action: #selector(rightButtonTapped)
        )
        navigationItem.titleView = customNavigationBar
        navigationItem.leftBarButtonItem?.tintColor = .white
        navigationItem.rightBarButtonItem?.tintColor = .white
        customNavigationBar.addSubview(searchTF)
        
        searchTF.frame = .init(
            x: 2, y: 2,
            width: customNavigationBar.frame.width - 4,
            height: customNavigationBar.frame.height - 4
        )
        searchTF.layer.cornerRadius = searchTF.frame.height / 2
        searchTF.backgroundColor = .systemGray.withAlphaComponent(0.6)
        searchTF.placeholder = "Izlash"
        searchTF.textColor = .white
        searchTF.attributedPlaceholder = NSAttributedString(
            string: "Izlash",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        searchTF.addSubview(searchButtton)
        
        searchButtton.translatesAutoresizingMaskIntoConstraints = false
        searchButtton.topAnchor.constraint(equalTo: searchTF.topAnchor, constant: 4).isActive = true
        searchButtton.trailingAnchor.constraint(equalTo: searchTF.trailingAnchor, constant: -4).isActive = true
        searchButtton.bottomAnchor.constraint(equalTo: searchTF.bottomAnchor, constant: -4).isActive = true
        searchButtton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchButtton.tintColor = .white
        
    }
    
    @objc private func leftButtonTapped(){
        let vc = ProfileVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func rightButtonTapped(){
        let vc1 = NotificationVC()
        navigationController?.pushViewController(vc1, animated: true)
    }
    
    @objc private func refreshData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.mainView.asosiyCollectionView.reloadData()
            self.refreshControl.endRefreshing()
        }
    }
}

extension AsosiyVC: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return SectionType.allCases.count
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
