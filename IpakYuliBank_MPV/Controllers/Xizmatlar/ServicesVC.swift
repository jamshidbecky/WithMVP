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
        
//    private lazy var searchBar: UISearchBar = {
//        let sb = UISearchBar()
//        sb.placeholder = "Search"
//        return sb
//    }()
        
    private let searchController = UISearchController(searchResultsController: nil)

    
    override func loadView() {
        super.loadView()
        view = servicesView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        title = "Xizmatlar"
//        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(searchButtonTapped))
//        navigationItem.rightBarButtonItem?.tintColor = .black
        
//        searchBar.alpha = 0.0
        
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Products"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        
        
        servicesView.serviceCollectionView.delegate = self
        servicesView.serviceCollectionView.dataSource = self
    }
    
//    @objc private func searchButtonTapped(){
//        print("ok service")
//        if isSearchBarVisible {
//            hideSearchBar()
//        } else {
//            showSearchBar()
//        }
//    }
    
//    private func showSearchBar() {
//        UIView.animate(withDuration: 0.5) {
//            self.searchBar.alpha = 1.0
//        }
//        isSearchBarVisible = true
//    }
    
//    private func hideSearchBar() {
//        UIView.animate(withDuration: 0.5) {
//            self.searchBar.alpha = 0.0
//        }
//        isSearchBarVisible = false
//    }
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

extension ServicesVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text?.lowercased() {
            print("ok")
        }
    }
    
    
}
