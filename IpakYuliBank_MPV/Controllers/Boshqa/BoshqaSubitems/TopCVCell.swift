//
//  OthersCvCell.swift
//  IpakYuliBank_MPV
//
//  Created by locky on 31/01/24.
//

import UIKit

final class TopCVCell: UICollectionViewCell {
    
    private lazy var mainStack: UIStackView = {
        return .getStack(axis: .horizontal, distribution: .equalSpacing, align: .center, spacing: 10)
    }()
    
    private lazy var leftStack: UIStackView = {
        return .getStack(axis: .horizontal, distribution: .fill, align: .center, spacing: 10)
    }()
    
    private lazy var shadowView: UIView = {
        let v = UIView()
        v.backgroundColor = .clear
        return v
    }()
    
    private lazy var img: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "location")
        img.contentMode = .scaleAspectFit
        img.tintColor = UIColor(named: "mainColor")
        img.backgroundColor = .clear
        return img
    }()
    
    private lazy var titleLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 17)
        lbl.textColor = .black
        lbl.textAlignment = .left
        lbl.text = "Mening uyim"
        lbl.numberOfLines = 1
        return lbl
    }()
    
    private lazy var chevronImg: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "chevron.right")
        img.contentMode = .scaleAspectFit
        img.tintColor = .lightGray
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
        shadowView.layer.shadowColor = UIColor.gray.cgColor
        shadowView.layer.shadowOpacity = 0.4
        shadowView.layer.shadowOffset = .zero
        shadowView.layer.shadowRadius = 1.4
        shadowView.backgroundColor = .white
        contentView.addSubview(shadowView)
        
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        shadowView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 1.2).isActive = true
        shadowView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -1.2).isActive = true
        shadowView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 1.2).isActive = true
        shadowView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -1.2).isActive = true
        shadowView.layer.cornerRadius = 7
        
        shadowView.addSubview(mainStack)
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        mainStack.topAnchor.constraint(equalTo: shadowView.topAnchor, constant: 6).isActive = true
        mainStack.bottomAnchor.constraint(equalTo: shadowView.bottomAnchor, constant: -6).isActive = true
        mainStack.leadingAnchor.constraint(equalTo: shadowView.leadingAnchor, constant: 10).isActive = true
        mainStack.trailingAnchor.constraint(equalTo: shadowView.trailingAnchor, constant: -10).isActive = true
        
        mainStack.addArrangedSubview(leftStack)
        mainStack.addArrangedSubview(chevronImg)
        
        leftStack.addArrangedSubview(img)
        leftStack.addArrangedSubview(titleLbl)
    }
    
    func prepare(dm: TopDM){
        titleLbl.text = dm.title
        img.image = UIImage(systemName: dm.imgName)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
}
