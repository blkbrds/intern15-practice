//
//  ListCellLayout.swift
//  CollectionView
//
//  Created by PCI0019 on 7/2/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

protocol ListCellLayoutDelegate: AnyObject {
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat
}
protocol ListCellLayoutDatasource: AnyObject {
     func collectionView(_ controller: UICollectionView, heightForColumnAtIndexPath indexPath: IndexPath) -> CGFloat
}
class ListCellLayout: UICollectionViewLayout {

    weak var delegate: ListCellLayoutDelegate?

    private var numberOfColumns = 4
    private var cellPadding: CGFloat = 7
    private var cache: [UICollectionViewLayoutAttributes] = []
    private var contentHeight: CGFloat = 0

    private var contentWidth: CGFloat {
        guard let collectionView = collectionView else { return 0 }
        return collectionView.bounds.width - CGFloat(numberOfColumns + 1) * cellPadding
    }

    override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }


    func configLayout(cellPadding: CGFloat = 5, numberOfColumns: Int = 2) {
        self.cellPadding = cellPadding
        self.numberOfColumns = numberOfColumns }

    override func prepare() {
        guard
            cache.isEmpty, let delegate = delegate, let collectionView = collectionView
            else { return }

        let columnWidth = contentWidth / CGFloat(numberOfColumns)
        var xOffset: [CGFloat] = []

        for column in 0..<numberOfColumns {
            xOffset.append(CGFloat(column) * columnWidth)
        }

        var column = 0
        var yOffset: [CGFloat] = .init(repeating: 0, count: numberOfColumns)


        for item in 0..<collectionView.numberOfItems(inSection: 0) {
            let indexPath = IndexPath(item: item, section: 0)

            let photoHeight = delegate.collectionView(
                collectionView, heightForPhotoAtIndexPath: indexPath)
            let cellWidth = columnWidth
            let height = photoHeight * cellWidth / 500
            let frame = CGRect(x: xOffset[column],
                               y: yOffset[column],
                               width: columnWidth,
                               height: height)
            let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)

            attributes.frame = insetFrame
            cache.append(attributes)
            contentHeight = max(contentHeight, frame.maxY)
            yOffset[column] = yOffset[column] + height
            column = column < (numberOfColumns - 1) ? (column + 1) : 0
        }
    }

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var visibleLayoutAttributes: [UICollectionViewLayoutAttributes] = []

        for attributes in cache {
            if attributes.frame.intersects(rect) {
                visibleLayoutAttributes.append(attributes)
            }
        }
        return visibleLayoutAttributes
    }

    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cache[indexPath.item]
    }
}
