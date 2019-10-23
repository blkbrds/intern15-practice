//
//  PinterestLayout.swift
//  CollectionViewFlowLayout
//
//  Created by PhuocNguyen on 10/21/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

protocol PinterestLayoutDelegate: class {
    func collectionView(_ collectionView: UICollectionView, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize
}

final class PinterestLayout: UICollectionViewLayout {
    
    weak var delegate: PinterestLayoutDelegate?
    private var numberColumns = 2
    private var cellPadding: CGFloat = 5
    private var cache: [UICollectionViewLayoutAttributes] = []
    private var contentHeight: CGFloat = 0
    private var width: CGFloat {
        guard let cv = collectionView else { return 0 }
        return cv.bounds.width - CGFloat(numberColumns + 1) * cellPadding
    }
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: width, height: contentHeight)
    }
    
    func configLayout(cellPadding: CGFloat = 5, numberOfColumns: Int = 2) {
        self.cellPadding = cellPadding
        self.numberColumns = numberOfColumns
    }
    
    override func prepare() {
        super.prepare()
        if cache.isEmpty, let delegate = delegate, let collectionView = collectionView {
            let columnWidth = width / CGFloat(numberColumns)
            var xOffSets: [CGFloat] = []
            for column in 0..<numberColumns {
                xOffSets.append(CGFloat(column) * columnWidth + CGFloat(column + 1) * cellPadding)
            }
            var yOffSets: [CGFloat] = [CGFloat](repeating: 0, count: numberColumns)
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
                contentHeight = max(contentHeight, frame.maxY)
                yOffSets[column] += cellHeight + cellPadding
                column = column < (numberColumns - 1) ? column + 1 : 0
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
