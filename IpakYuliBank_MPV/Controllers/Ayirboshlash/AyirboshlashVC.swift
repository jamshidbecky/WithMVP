//
//  Ayirboshlash.swift
//  IpakYuliBank_MPV
//
//  Created by locky on 24/01/24.
//

import UIKit

final class AyirboshlashVC: UIViewController {
    private lazy var mainStack: UIStackView = {
        return .getStack(axis: .vertical, distribution: .fill, align: .center, spacing: 20)
    }()
    
    private lazy var emptyImg: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "none1")
        img.contentMode = .scaleAspectFit
        img.backgroundColor = .clear
        return img
    }()
    
    private lazy var titleLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = .boldSystemFont(ofSize: 17)
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.text = "Siz indentifikatsiyalanmagan foydalanuvchisiz"
        lbl.numberOfLines = 0
        return lbl
    }()
    
    private lazy var descLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 17)
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        lbl.numberOfLines = 0
        return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Ayirboshlash"
        initUI()
    }
    
    private func initUI() {
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Kurslar", style: .done, target: self, action: #selector(kurslarTapped))
        navigationItem.rightBarButtonItem?.tintColor = UIColor(named: "mainColor")
        
        view.addSubview(mainStack)
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        mainStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        mainStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        mainStack.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        
        mainStack.addArrangedSubview(emptyImg)
        mainStack.addArrangedSubview(titleLbl)
        mainStack.addArrangedSubview(descLbl)
    }
    
    @objc private func kurslarTapped() {
        print("ok")
    }
    
}
