//
//  TransactionHistoryCvCell.swift
//  IpakYuliBank_MPV
//
//  Created by locky on 31/01/24.
//

import UIKit

final class TransactionHistoryCvCell: UICollectionViewCell {
    
    private lazy var mainStack: UIStackView = {
        return .getStack(axis: .vertical, distribution: .fillEqually, align: .fill, spacing: 8)
    }()
    
    private lazy var topStack: UIStackView = {
        return .getStack(axis: .horizontal, distribution: .equalSpacing, align: .fill, spacing: 8)
    }()
    
    private lazy var bottomStack: UIStackView = {
        return .getStack(axis: .horizontal, distribution: .equalSpacing, align: .fill, spacing: 8)
    }()
    
    private lazy var shadowView: UIView = {
        let v = UIView()
        v.backgroundColor = .clear
        return v
    }()
    
    private lazy var dateLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 15)
        lbl.textColor = .black
        lbl.textAlignment = .left
        lbl.text = "27 yanvar"
        lbl.numberOfLines = 1
        return lbl
    }()
    
    private lazy var timeLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 15)
        lbl.textColor = .gray
        lbl.textAlignment = .right
        lbl.text = "18:02"
        lbl.numberOfLines = 1
        return lbl
    }()
    
    private lazy var typeLbl: UILabel = {
        let lbl = UILabel()
        lbl.backgroundColor = .lightGray
        lbl.font = .boldSystemFont(ofSize: 15)
        lbl.textColor = .black
        lbl.textAlignment = .left
        lbl.text = "To'lov"
        lbl.numberOfLines = 1
        return lbl
    }()
    
    private lazy var valueLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 15)
        lbl.textColor = .gray
        lbl.textAlignment = .right
        lbl.text = "5 780 UZS"
        lbl.numberOfLines = 1
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                shadowView.backgroundColor = .lightGray
            } else {
                shadowView.backgroundColor = .white
            }
        }
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
        mainStack.topAnchor.constraint(equalTo: shadowView.topAnchor, constant: 10).isActive = true
        mainStack.bottomAnchor.constraint(equalTo: shadowView.bottomAnchor, constant: -10).isActive = true
        mainStack.leadingAnchor.constraint(equalTo: shadowView.leadingAnchor, constant: 10).isActive = true
        mainStack.trailingAnchor.constraint(equalTo: shadowView.trailingAnchor, constant: -10).isActive = true
        
        mainStack.addArrangedSubview(topStack)
        mainStack.addArrangedSubview(bottomStack)
        
        topStack.addArrangedSubview(dateLbl)
        topStack.addArrangedSubview(timeLbl)
        
        bottomStack.addArrangedSubview(typeLbl)
        bottomStack.addArrangedSubview(valueLbl)
    
    }
    
    func prepare(dm: TransactionHistoryDM){
        timeLbl.text = dm.time
        dateLbl.text = dm.date
        valueLbl.text = dm.value
        typeLbl.text = dm.howTransaction
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        typeLbl.layer.cornerRadius = 5
        
    }
    
}
