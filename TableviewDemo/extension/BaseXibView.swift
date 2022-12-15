//
//  BaseXibView.swift
//  TableviewDemo
//
//  Created by 葉育彣 on 2022/12/15.
//

import UIKit


class BaseXibView: UIView {
    
    @IBInspectable var nibName: String?
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    func xibSetup() {
        let boundle = Bundle(for: self.classForCoder)
        if nibName == nil {
            nibName = "\(self.classForCoder)"
        }
        let nib = UINib(nibName: nibName!, bundle: boundle)
        if let view = nib.instantiate(withOwner: self, options: nil).first as? UIView {
            view.frame = self.bounds
            view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            self.addSubview(view)
        }
    }
    
    
}
