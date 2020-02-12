//
//  PinterestLayout.swift
//  Baitap02
//
//  Created by PCI0008 on 1/16/20.
//  Copyright © 2020 PCI0008. All rights reserved.
//

import UIKit

protocol PinterestLayoutDelegate: class {
    func collectionView(_ collectionView: UICollectionView, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize
}

final class PinterestLayout: UICollectionViewLayout {
    
    struct Config {
        static var numberOfColumns = 2
        static var cellPadding: CGFloat = 5
        static var contentHeight: CGFloat = 0
    }
    
    weak var delegate: PinterestLayoutDelegate?
    private var cache: [UICollectionViewLayoutAttributes] = []
    private var width: CGFloat {
        guard let collectionView = collectionView else { return 0 }
        return collectionView.bounds.width - CGFloat(Config.numberOfColumns + 1) * Config.cellPadding
    }
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: width, height: Config.contentHeight)
    }
    
    func configLayout(cellPadding: CGFloat = 5, numberOfColumns: Int = 2) {
        Config.cellPadding = cellPadding
        Config.numberOfColumns = numberOfColumns
    }
    
    override func prepare() {
        super.prepare()
        if cache.isEmpty, let delegate = delegate, let collectionView = collectionView {
            let columnWidth = width / max(1, CGFloat(Config.numberOfColumns))
            var xOffSets: [CGFloat] = []
            for column in 0..<Config.numberOfColumns {
                xOffSets.append(CGFloat(column) * columnWidth + CGFloat(column + 1) * Config.cellPadding)
            }
            var yOffSets: [CGFloat] = [CGFloat](repeating: 0, count: Config.numberOfColumns)
            var column = 0
            for item in 0..<collectionView.numberOfItems(inSection: 0) {
                let indexPath = IndexPath(item: item, section: 0)
                let size = delegate.collectionView(collectionView, sizeForItemAtIndexPath: indexPath)
                let cellWidth = columnWidth
                let cellHeight = size.height * cellWidth / size.width
                let frame = CGRect(x: xOffSets[column], y: yOffSets[column], width: cellWidth, height: cellHeight)
                let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
                attributes.frame = frame
                cache.append(attributes)
                Config.contentHeight = max(Config.contentHeight, frame.maxY)
                yOffSets[column] += cellHeight + Config.cellPadding
                column = column < (Config.numberOfColumns - 1) ? column + 1 : 0
            }
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var layoutAttributes: [UICollectionViewLayoutAttributes] = []
        for attribute in cache {
            if attribute.frame.intersects(rect) {
                layoutAttributes.append(attribute)
            }
        }
        return layoutAttributes
    }
}
