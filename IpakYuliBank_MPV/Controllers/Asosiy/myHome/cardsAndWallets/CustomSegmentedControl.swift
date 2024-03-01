//
//  CustomSegmentedControl.swift
//  IpakYuliBank_MPV
//
//  Created by locky on 22/02/24.
//


import UIKit

protocol CustomSegmentedControlDelegate: AnyObject {
    func didSelectItemAt(index: Int)
}

class CustomSegmentedControl: UIView {
    weak var delegate: CustomSegmentedControlDelegate?
    
    private var selectedIndex = 0
    private var collectionView: UICollectionView!
    private let bottomBorderView = UIView()
    private lazy var mainStack: UIStackView = {
        return .getStack(axis: .vertical, distribution: .fill, align: .fill, spacing: 3)
    }()

    private let cellIdentifier = "SegmentCell"
    
    var items: [String] = [] {
        didSet {
            collectionView.reloadData()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCollectionView()
        setupBottomBorder()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupCollectionView()
        setupBottomBorder()
    }

    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        collectionView = UICollectionView(
            frame: .init(x: 2, y: 2, width: frame.width - 4, height: frame.height - 8),
            collectionViewLayout: layout
        )
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
        collectionView.backgroundColor = UIColor.clear
        collectionView.showsHorizontalScrollIndicator = false

        addSubview(collectionView)
    }

    private func setupBottomBorder() {
        bottomBorderView.backgroundColor = UIColor.systemPink
        addSubview(bottomBorderView)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        collectionView.frame = .init(x: 2, y: 2, width: frame.width - 4, height: frame.height - 8)
        bottomBorderView.frame = CGRect(x: 2, y: frame.height - 8, width: bounds.width / CGFloat(items.count), height: 4)

    }
}
//15 + titlecount * 8

extension CustomSegmentedControl: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        cell.contentView.subviews.forEach { $0.removeFromSuperview() }

        let label = UILabel(frame: cell.contentView.bounds)
        label.text = items[indexPath.item]
        label.textAlignment = .center
        cell.contentView.addSubview(label)
        return cell
    }
}

extension CustomSegmentedControl: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.item
        delegate?.didSelectItemAt(index: selectedIndex)

        let newOriginX = CGFloat(selectedIndex) * (bounds.width / CGFloat(items.count))
        UIView.animate(withDuration: 0.3) {
            self.bottomBorderView.frame.origin.x = newOriginX
        }
    }
}

extension CustomSegmentedControl: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: bounds.width / CGFloat(items.count), height: bounds.height)
    }
}
