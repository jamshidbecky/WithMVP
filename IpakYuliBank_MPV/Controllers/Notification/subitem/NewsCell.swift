//
//  NewsCell.swift
//  IpakYuliBank_MPV
//
//  Created by locky on 01/02/24.
//

import UIKit

final class NewsCell: UITableViewCell {
    
    private lazy var frameView: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        return v
    }()
    
    private lazy var topStack: UIStackView = {
        return .getStack(axis: .vertical, distribution: .fill, align: .fill, spacing: 20)
    }()
    
    private lazy var dateStack: UIStackView = {
        return .getStack(axis: .horizontal, distribution: .equalSpacing, align: .fill, spacing: 10)
    }()
    
    private lazy var dateLeftStack: UIStackView = {
        return .getStack(axis: .horizontal, distribution: .fill, align: .fill, spacing: 10)
    }()
    
    private lazy var dayLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = .boldSystemFont(ofSize: 8)
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.backgroundColor = UIColor(named: "mainColor")
        lbl.text = "DU"
        lbl.numberOfLines = 1
        lbl.layer.cornerRadius = 3
        return lbl
    }()
    
    private lazy var dateLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 10)
        lbl.textColor = .darkGray
        lbl.textAlignment = .left
        lbl.text = "30 yanvar 2024"
        lbl.numberOfLines = 1
        return lbl
    }()
    
    private lazy var timeLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 10)
        lbl.textColor = .darkGray
        lbl.textAlignment = .left
        lbl.text = "16:12"
        lbl.numberOfLines = 1
        return lbl
    }()
    
    private lazy var titleLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = .boldSystemFont(ofSize: 17)
        lbl.textColor = .black
        lbl.textAlignment = .left
        lbl.text = "Oy oxiri - hisoblarni to'lash vaqti."
        lbl.numberOfLines = 1
        return lbl
    }()
    
    private lazy var contentViewImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "w21")
        img.contentMode = .scaleToFill
        img.tintColor = .red
        img.backgroundColor = .clear
        img.translatesAutoresizingMaskIntoConstraints = false
        img.heightAnchor.constraint(equalToConstant: 200).isActive = true
        return img
    }()
    
    private lazy var dscrptnLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 14)
        lbl.textColor = .black
        lbl.textAlignment = .left
        lbl.text = "Yo‘l va navbatda turishga vaqtingizni behuda sarflamang - kommunal xizmatlar, internet, televideniya, mobil aloqa va boshqalar uchun to‘lovlarni ilovamiz orqali amalga oshiring. Asosiy ekranda “to‘lovlar” tugmasini bosing; Kerakli toifani tanlang va onlayn to‘lovni amalga oshiring."
        lbl.numberOfLines = 0
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        customUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func customUI() {
        contentView.backgroundColor = .clear
        contentView.addSubview(frameView)
        frameView.translatesAutoresizingMaskIntoConstraints = false
        frameView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        frameView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        frameView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        frameView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        
        frameView.addSubview(topStack)
        topStack.translatesAutoresizingMaskIntoConstraints = false
        topStack.topAnchor.constraint(equalTo: frameView.topAnchor, constant: 15).isActive = true
        topStack.leadingAnchor.constraint(equalTo: frameView.leadingAnchor, constant: 10).isActive = true
        topStack.trailingAnchor.constraint(equalTo: frameView.trailingAnchor, constant: -10).isActive = true
        
        topStack.addArrangedSubview(dateStack)
        topStack.addArrangedSubview(titleLbl)
        
        dateStack.addArrangedSubview(dateLeftStack)
        dateStack.addArrangedSubview(timeLbl)
        
        dateLeftStack.addArrangedSubview(dayLbl)
        dateLeftStack.addArrangedSubview(dateLbl)
        
        frameView.addSubview(contentViewImage)
        contentViewImage.translatesAutoresizingMaskIntoConstraints = false
        contentViewImage.topAnchor.constraint(equalTo: topStack.bottomAnchor, constant: 20).isActive = true
        contentViewImage.leadingAnchor.constraint(equalTo: frameView.leadingAnchor, constant: 0).isActive = true
        contentViewImage.trailingAnchor.constraint(equalTo: frameView.trailingAnchor, constant: 0).isActive = true
        contentViewImage.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        frameView.addSubview(dscrptnLbl)
        dscrptnLbl.translatesAutoresizingMaskIntoConstraints = false
        dscrptnLbl.topAnchor.constraint(equalTo: contentViewImage.bottomAnchor, constant: 20).isActive = true
        dscrptnLbl.leadingAnchor.constraint(equalTo: frameView.leadingAnchor, constant: 15).isActive = true
        dscrptnLbl.trailingAnchor.constraint(equalTo: frameView.trailingAnchor, constant: -15).isActive = true
        dscrptnLbl.bottomAnchor.constraint(equalTo: frameView.bottomAnchor, constant: -20).isActive = true
        
    }
}
