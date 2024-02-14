//
//  MyCardsCvCell.swift
//  IpakYuliBank_MPV
//
//  Created by locky on 31/01/24.
//

import UIKit

final class MyCardsCvCell: TouchableCVCell {
    
    private lazy var mainStack: UIStackView = {
        return .getStack(axis: .vertical, distribution: .fillEqually, align: .fill, spacing: 20)
    }()
    
    private lazy var topStack: UIStackView = {
        return .getStack(axis: .horizontal, distribution: .equalSpacing, align: .fill, spacing: 8)
    }()
    
    private lazy var bottomStack: UIStackView = {
        return .getStack(axis: .horizontal, distribution: .equalSpacing, align: .fill, spacing: 8)
    }()
    
    private lazy var miniStack: UIStackView = {
        return .getStack(axis: .horizontal, distribution: .equalSpacing, align: .fill, spacing: 8)
    }()
    
    private lazy var shadowView: UIView = {
        let v = UIView()
        v.backgroundColor = .clear
        return v
    }()
    
    private lazy var nameLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 15)
        lbl.textColor = .white
        lbl.textAlignment = .left
        lbl.text = "KHONDAMIR KHAYDAROV"
        lbl.numberOfLines = 1
        return lbl
    }()
    
    private lazy var isFavorite: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "star")
        img.contentMode = .scaleAspectFit
        img.tintColor = .white
        img.backgroundColor = .clear
        return img
    }()
    
    private lazy var valueLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = .boldSystemFont(ofSize: 15)
        lbl.textColor = .white
        lbl.textAlignment = .right
        lbl.text = "780 UZS"
        lbl.numberOfLines = 1
        return lbl
    }()
    
    private lazy var cardNumberLbl: UILabel = {
        let lbl = UILabel()
        lbl.backgroundColor = .clear
        lbl.font = .boldSystemFont(ofSize: 15)
        lbl.textColor = .white
        lbl.textAlignment = .left
        lbl.text = "**** 8947"
        lbl.numberOfLines = 1
        return lbl
    }()
    
    private lazy var cardType: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "arrow.rectanglepath")
        img.contentMode = .scaleAspectFit
        img.tintColor = .white
        img.backgroundColor = .clear
        return img
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initCell(){
//        shadowView.layer.shadowColor = UIColor.gray.cgColor
//        shadowView.layer.shadowOpacity = 0.4
//        shadowView.layer.shadowOffset = .zero
//        shadowView.layer.shadowRadius = 1.4
        shadowView.backgroundColor = UIColor(named: "mainColor")!.withAlphaComponent(0.7)
        contentView.addSubview(shadowView)
        
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        shadowView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 1.2).isActive = true
        shadowView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -1.2).isActive = true
        shadowView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 1.2).isActive = true
        shadowView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -1.2).isActive = true
        shadowView.layer.cornerRadius = 7
        
        shadowView.addSubview(mainStack)
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        mainStack.topAnchor.constraint(equalTo: shadowView.topAnchor, constant: 10).isActive = true
        mainStack.bottomAnchor.constraint(equalTo: shadowView.bottomAnchor, constant: -10).isActive = true
        mainStack.leadingAnchor.constraint(equalTo: shadowView.leadingAnchor, constant: 10).isActive = true
        mainStack.trailingAnchor.constraint(equalTo: shadowView.trailingAnchor, constant: -10).isActive = true
        
        mainStack.addArrangedSubview(topStack)
        mainStack.addArrangedSubview(bottomStack)
        
        topStack.addArrangedSubview(nameLbl)
        topStack.addArrangedSubview(isFavorite)
        
        bottomStack.addArrangedSubview(valueLbl)
        bottomStack.addArrangedSubview(miniStack)
        
        miniStack.addArrangedSubview(cardNumberLbl)
        miniStack.addArrangedSubview(cardType)
    
    }
    
    func prepare(dm: MyCardsDM){
        nameLbl.text = dm.name
        isFavorite.tintColor = dm.isFavorites ? .yellow : .white
        valueLbl.text = dm.value
        cardNumberLbl.text = dm.type
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
}
