//
//  CoverFlowCollectionViewCell.swift
//  TableviewDemo
//
//  Created by 葉育彣 on 2022/12/15.
//

import UIKit

class CoverFlowCollectionViewCell: UICollectionViewCell {
    

    private var coverNumber: UILabel!
    
    var imageName: String = "" {
        didSet {
        }
    }
    var text: String = "" {
        didSet {
            coverNumber.text = text
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
      coverNumber = UILabel()
        coverNumber.frame = self.bounds
        contentView.addSubview(coverNumber)
        backgroundColor = .gray
    }
    
 
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
