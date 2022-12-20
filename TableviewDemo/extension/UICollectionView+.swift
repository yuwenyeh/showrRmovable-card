//
//  UICollectionView+.swift
//  TableviewDemo
//
//  Created by 葉育彣 on 2022/12/8.
//

import UIKit

extension UICollectionView {
    
    func registerXibCell(_ aCell: UICollectionViewCell.Type) {
        self.register(UINib(nibName: "\(aCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(aCell.self)")
    }
    
    func rgister(_ aCell: UICollectionViewCell.Type){
        self.register(aCell.self, forCellWithReuseIdentifier: "\(aCell.self)")
    }
    

    
    func registerCells(_ aCells: [UICollectionViewCell.Type]) {
        for _cell in aCells {
            self.register(UINib(nibName: "\(_cell.self)", bundle: nil), forCellWithReuseIdentifier: "\(_cell.self)")
        }
    }
    
    func dequeueResuableCell<T: UICollectionViewCell>(for aIndexpath: IndexPath) -> T{
        return self.dequeueReusableCell(withReuseIdentifier: "\(T.self)", for: aIndexpath) as! T
    }
    
    func registerSupplementaryViewWithHeader(_ aView: UICollectionReusableView.Type) {
        self.register(UINib(nibName: "\(aView.self)", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "\(aView.self)")
    }
    
    func dequeueResuableSupplementaryViewWithHeader<T: UICollectionReusableView>(for aIndexPath: IndexPath)-> T {
        return self.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "\(T.self)", for: aIndexPath) as! T
    }
    
    
    
}//extension


