//
//  mHomeCollectionViewCell.swift
//  TableviewDemo
//
//  Created by 葉育彣 on 2022/12/8.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    var cellIndex: Int = 0 {
        didSet {
            mLabel.text = "\(cellIndex)"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUI(_ index: Int){
        imageView.image = UIImage(named: "\(index)")
    }

}
