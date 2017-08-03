//
//  ScrollHorizontallyView.swift
//  Pods
//
//  Created by Jiexiang on 2017/8/3.
//
//

import UIKit

public protocol ScrollHorizontallyViewDataSource {
    func items() -> [ScrollInfo]
    func itemWidth() -> CGFloat
}

public protocol ScrollHorizontallyViewDelegate {
    func scrollHorizontallyView(didSelectItemAt scrollInfo: ScrollInfo)
}

public struct ScrollInfo {
    public var title: String
    public var imageName: String
    public var opeartion: (() -> Void)?
    
    public init(title: String, imageName: String, opeartion: (() -> Void)?) {
        self.title = title
        self.imageName = imageName
        self.opeartion = opeartion
    }
}

private let cellID = "ScrollHorizontallyCell"

public class ScrollHorizontallyView: UIView {

    public var delegate: ScrollHorizontallyViewDelegate?
    public var dataSource: ScrollHorizontallyViewDataSource!

    var layout: UICollectionViewFlowLayout!
    var collectionView: UICollectionView!
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        layout.itemSize = CGSize(width: dataSource.itemWidth(), height: bounds.height)
    }
}

private extension ScrollHorizontallyView {
    func setup() {
        layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 8

        collectionView = UICollectionView(frame: bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        // 滚动条
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.scrollsToTop = false
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: cellID, bundle: Bundle(for: ScrollHorizontallyView.self)), forCellWithReuseIdentifier: cellID)
        addSubview(collectionView)
    }
}

extension ScrollHorizontallyView: UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.items().count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! ScrollHorizontallyCell
        let scrollInfo = dataSource.items()[indexPath.row]
        cell.titleLabel.text = scrollInfo.title
        cell.imageView.image = UIImage(named: scrollInfo.imageName)
        return cell
    }
}

extension ScrollHorizontallyView: UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.scrollHorizontallyView(didSelectItemAt: dataSource.items()[indexPath.row])
    }
}
