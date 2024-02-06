//
//  NotificationVC.swift
//  IpakYuliBank_MPV
//
//  Created by locky on 01/02/24.
//

import UIKit

enum ElementsType: Int, CaseIterable {
    case news
    case notifications
}

final class NotificationVC: UIViewController {
    
    private var isNews = true
    private var isNotifications = false
    
    private lazy var newsTableView: UITableView = {
        let tV = UITableView()
        tV.backgroundColor = .clear
        tV.separatorStyle = .none
        tV.showsVerticalScrollIndicator = false
        tV.register(NewsCell.self, forCellReuseIdentifier: "NewsCell")
        return tV
    }()
    
    private lazy var notificationsTableView: UITableView = {
        let tV = UITableView()
        tV.backgroundColor = .clear
        tV.separatorStyle = .none
        tV.showsVerticalScrollIndicator = false
        tV.register(NewsCell.self, forCellReuseIdentifier: "NewsCell")
        return tV
    }()
    
    private lazy var mainStack: UIStackView = {
        return .getStack(axis: .horizontal, distribution: .fillEqually, align: .fill, spacing: 4)
    }()
    
    private lazy var newsStack: UIStackView = {
        return .getStack(axis: .vertical, distribution: .fill, align: .fill, spacing: 6)
    }()
    
    private lazy var notificationsStack: UIStackView = {
        return .getStack(axis: .vertical, distribution: .fill, align: .fill, spacing: 6)
    }()
    
    private lazy var newsLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = .boldSystemFont(ofSize: 17)
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.text = "Yangiliklar"
        lbl.numberOfLines = 1
        return lbl
    }()
    
    private lazy var newsView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.heightAnchor.constraint(equalToConstant: 4).isActive = true
        v.backgroundColor = UIColor(named: "mainColor")
        return v
    }()
    
    private lazy var notificationsLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 17)
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.text = "Xabarnomalar"
        lbl.numberOfLines = 1
        return lbl
    }()
    
    private lazy var notificationsView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.heightAnchor.constraint(equalToConstant: 4).isActive = true
        v.backgroundColor = .clear
//        v.backgroundColor = UIColor(named: "mainColor")
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        newsTableView.dataSource = self
        newsTableView.delegate = self
        
        notificationsTableView.dataSource = self
        notificationsTableView.delegate = self
        
        
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(newsPressed))
        swipeLeft.direction = .right
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(notificationPressed))
        swipeRight.direction = .left
        
        view.addGestureRecognizer(swipeLeft)
        view.addGestureRecognizer(swipeRight)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            tabBarController?.tabBar.isHidden = true
        }

        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            tabBarController?.tabBar.isHidden = false
        }
    private func setupUI() {
        view.backgroundColor = UIColor(red: 243/255, green: 246/255, blue: 248/255, alpha: 1)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .done, target: self, action: #selector(leftBtnTapped))
        navigationItem.leftBarButtonItem?.tintColor = .black
        
        view.addSubview(mainStack)
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        mainStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        mainStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        mainStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        
        mainStack.addArrangedSubview(newsStack)
        mainStack.addArrangedSubview(notificationsStack)
        
        newsStack.addArrangedSubview(newsLbl)
        newsStack.addArrangedSubview(newsView)
        
        notificationsStack.addArrangedSubview(notificationsLbl)
        notificationsStack.addArrangedSubview(notificationsView)
        
        let newsTap = UITapGestureRecognizer(target: self, action: #selector(newsPressed))
        newsStack.addGestureRecognizer(newsTap)
        view.isUserInteractionEnabled = true
        
        let notificationTap = UITapGestureRecognizer(target: self, action: #selector(notificationPressed))
        notificationsStack.addGestureRecognizer(notificationTap)
        view.isUserInteractionEnabled = true
        
        view.addSubview(notificationsTableView)
        notificationsTableView.translatesAutoresizingMaskIntoConstraints = false
        notificationsTableView.topAnchor.constraint(equalTo: mainStack.bottomAnchor, constant: 0).isActive = true
        notificationsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        notificationsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        notificationsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        notificationsTableView.isHidden = true
        
        view.addSubview(newsTableView)
        newsTableView.translatesAutoresizingMaskIntoConstraints = false
        newsTableView.topAnchor.constraint(equalTo: mainStack.bottomAnchor, constant: 0).isActive = true
        newsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        newsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        newsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    
//    @objc private func respondToGesture(gesture: UISwipeGestureRecognizer) {
//        switch gesture.direction {
//        case UISwipeGestureRecognizer.Direction.left:
//            print("left swipe")
//        case UISwipeGestureRecognizer.Direction.right:
//            print("right swipe")
//        default:
//            break
//        }
//    }
    
    @objc private func leftBtnTapped() {
        navigationController?.popViewController(animated: true)
        tabBarController?.tabBar.isHidden = true
    }
    
    @objc private func newsPressed() {
        isNews = true
        isNotifications = false
        if isNews == true && isNotifications == false {
            newsLbl.font = .boldSystemFont(ofSize: 17)
            newsView.backgroundColor = UIColor(named: "mainColor")
            notificationsLbl.font = .systemFont(ofSize: 17)
            notificationsView.backgroundColor = .clear
            notificationsTableView.isHidden = true
            newsTableView.isHidden = false
            newsTableView.reloadData()
        }
    }
    
    @objc private func notificationPressed() {
        isNews = false
        isNotifications = true
        
        if isNews == false && isNotifications == true {
            newsLbl.font = .systemFont(ofSize: 17)
            newsView.backgroundColor = .clear
            notificationsLbl.font = .boldSystemFont(ofSize: 17)
            notificationsView.backgroundColor = UIColor(named: "mainColor")
            notificationsTableView.isHidden = false
            newsTableView.isHidden = true
            notificationsTableView.reloadData()
        }
        print("notifications Tap")
    }
}

extension NotificationVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        newsTableView.isHidden && notificationsTableView.isHidden == false ? 1 : 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if newsTableView.isHidden && notificationsTableView.isHidden == false {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsCell
            return cell
        }
        
    }
}
