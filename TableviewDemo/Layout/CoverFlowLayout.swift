//
//  CoverFlowLayout.swift
//  TableviewDemo
//
//  Created by 葉育彣 on 2022/12/8.
//


import UIKit

class CoverFlowLayout: UICollectionViewFlowLayout {
    
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        //取得範圍內的佈局數組
        let attributes = super.layoutAttributesForElements(in: rect)
        //計算整體中心點x坐標
        let centerX = collectionView!.contentOffset.x + collectionView!.bounds.width / 2
        
        //根據滾動對每一個cell進行對應縮放
        attributes?.forEach({ attr in
            let pad = abs(centerX - attr.center.x)
            
            //距離愈小縮放愈小，縮放最大值1，中心點 = x, 重合時縮放 = 1
            
            let factor = 0.0009
            let scale = 1 / (1 + pad * CGFloat(factor))
            attr.transform = CGAffineTransform(scaleX: scale, y: scale)
        })
        //返回修改後的attributes數組
        return attributes
    }
    //滾動時停下的偏移量
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        var targetPoint = proposedContentOffset
        //計算中心點的x值
        let centerX = proposedContentOffset.x + collectionView!.bounds.width / 2
        //獲取這個點collection的屬性
        let attrs = self.layoutAttributesForElements(in: CGRect(x: proposedContentOffset.x, y: proposedContentOffset.y, width: collectionView!.bounds.size.width, height: collectionView!.bounds.size.height))
        
        //3 需要移動最小的距離
        var moveDistance: CGFloat = CGFloat(MAXFLOAT)
        //4找出最小距離
        attrs?.forEach{ (attr) in
            if abs(attr.center.x - centerX) < abs(moveDistance) {
                moveDistance = attr.center.x - centerX
            }
        }
        //5返回一個新的偏移點
        if targetPoint.x > 0 && targetPoint.x < collectionViewContentSize.width - collectionView!.bounds.width {
            targetPoint.x += moveDistance
        }
        return targetPoint
    }
    
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: sectionInset.left + sectionInset.right + (CGFloat(collectionView!.numberOfItems(inSection: 0)) * (itemSize.width + minimumLineSpacing)) - minimumLineSpacing, height: 0)

    }
    
}
