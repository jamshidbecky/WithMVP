//
//  MyHomeCvCell.swift
//  IpakYuliBank_MPV
//
//  Created by locky on 30/01/24.
//

import UIKit

final class MyHomeCvCell: UICollectionViewCell {
    
    private lazy var mainView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(red: 235/255, green: 237/255, blue: 240/255, alpha: 1)
        v.layer.cornerRadius = 15
        return v
    }()
    
    private lazy var mainStack: UIStackView = {
        return .getStack(axis: .horizontal, distribution: .fillEqually, align: .fill, spacing: 4)
    }()
    
    private lazy var leftStack: UIStackView = {
        return .getStack(axis: .vertical, distribution: .fillEqually, align: .leading, spacing: 4)
    }()
    
    private lazy var rightImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "house")
        img.contentMode = .scaleAspectFit
        img.backgroundColor = .clear
        return img
    }()
    
    private lazy var titleLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = .boldSystemFont(ofSize: 17)
        lbl.textColor = .black
        lbl.textAlignment = .left
        lbl.text = "Mening uyim"
        lbl.numberOfLines = 1
        return lbl
    }()
    
    private lazy var descriptionLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 12)
        lbl.textColor = .black
        lbl.textAlignment = .left
        lbl.text = "To'lovlaringizni bir joyga jamlang"
        lbl.numberOfLines = 2
        return lbl
    }()
    
    private lazy var startBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Boshlash", for: .normal)
        btn.setTitleColor(UIColor(named: "mainColor"), for: .normal)
        btn.setImage(UIImage(systemName: "arrow.forward"), for: .normal)
        btn.tintColor = UIColor(named: "mainColor")
        btn.backgroundColor = .clear
        return btn
    }()
    
    private lazy var newImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "new")
        img.contentMode = .scaleAspectFit
        img.backgroundColor = .clear
        return img
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initUI() {
        contentView.layer.cornerRadius = 16
        contentView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        contentView.backgroundColor = .white
        
        contentView.addSubview(mainView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        mainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15).isActive = true
        mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        mainView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        
        mainView.addSubview(mainStack)
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        mainStack.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 10).isActive = true
        mainStack.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -10).isActive = true
        mainStack.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 10).isActive = true
        mainStack.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -10).isActive = true
        
        mainStack.addArrangedSubview(leftStack)
        mainStack.addArrangedSubview(rightImage)
        
        leftStack.addArrangedSubview(titleLbl)
        leftStack.addArrangedSubview(descriptionLbl)
        leftStack.addArrangedSubview(startBtn)
        
        contentView.addSubview(newImage)
        newImage.translatesAutoresizingMaskIntoConstraints = false
        newImage.heightAnchor.constraint(equalToConstant: 12).isActive = true
        newImage.widthAnchor.constraint(equalToConstant: 18).isActive = true
        newImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12).isActive = true
        newImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 35).isActive = true
        
    }
}
