//
//  CollectionViewFlowLayout.swift
//  TableviewDemo
//
//  Created by 葉育彣 on 2022/12/8.
//

import Foundation
import UIKit

protocol HomeFallLayoutDelegate: NSObjectProtocol {
    func homeFlowLayout(_ homeFlowLayout: HomeFlowLayout, itemHeight indexPath: IndexPath) ->CGFloat
}

class HomeFlowLayout: UICollectionViewFlowLayout {
    weak var delegate : HomeFallLayoutDelegate?
    var spacing: CGFloat = 8
   //列的數量
    var totalCount:Int = 4
    //緩存計算好的屬性
    fileprivate var layoutAttributeArray:[UICollectionViewLayoutAttributes] = []
    //每列的高度
    fileprivate lazy var yArray:[CGFloat] = Array(repeating: self.sectionInset.top, count: totalCount)
    
    fileprivate var maxHeight: CGFloat = 0
    
    override func prepare() {
        super.prepare()
        self.minimumLineSpacing = spacing
        self.minimumInteritemSpacing = spacing
        self.sectionInset = UIEdgeInsets(top: 0, left: spacing, bottom: 0, right: spacing)
        //計算每個cell高度
        let itemWidth = (collectionView!.bounds.width - sectionInset.left - sectionInset.right - minimumInteritemSpacing * CGFloat(totalCount - 1)) / CGFloat(totalCount)
        // cell數量
        let itemCount = collectionView!.numberOfItems(inSection: 0)
        //最小高度索引
        var minHeightIndex = 0
        //遍歷item計算緩屬性
        for i in layoutAttributeArray.count ..< itemCount {
            let indexPath = IndexPath(item: i, section: 0)
            let attr = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            //獲取動態高度
            let itemHeight = delegate?.homeFlowLayout(self, itemHeight: indexPath)
            //找到高度最短的那一列
            let value = yArray.min()
            //獲取數組索引
            minHeightIndex = yArray.firstIndex(of: value!)!
            //獲取該列的y坐標
            var itemY = yArray[minHeightIndex]
            if i >= totalCount {
                itemY += minimumInteritemSpacing
            }
            
            //計算索引的x坐標
            let itemX = sectionInset.left + (itemWidth + minimumInteritemSpacing) * CGFloat(minHeightIndex)
            //賦於新的位置
            attr.frame = CGRect(x: itemX, y: itemY, width: itemWidth, height: CGFloat(itemHeight!))
            layoutAttributeArray.append(attr)
            //更新最得高度的數據
            yArray[minHeightIndex] = attr.frame.maxY
        }
        maxHeight = yArray.max()! + sectionInset.bottom
    }
}

extension HomeFlowLayout {
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return layoutAttributeArray.filter({$0.frame.intersects(rect)})
    }
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: collectionView!.bounds.width, height: maxHeight)
    }
}
