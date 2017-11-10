//
//  CustomView.swift
//  MiniCursoFinalProject
//
//  Created by Yasmin Benatti on 2017-11-09.
//  Copyright © 2017 Yasmin Benatti. All rights reserved.
//

import UIKit

@IBDesignable

class CustomView: UIView {
    
    // MARK: - IBOutlets
    @IBOutlet weak var centerImageView: UIImageView!
    
    // MARK: - Constraints
    @IBOutlet weak var centerImageViewCenterYConstraint: NSLayoutConstraint!
    @IBOutlet weak var centerImageViewWidthConstraint: NSLayoutConstraint!
    
    // MARK: - Init Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commomSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commomSetup()
    }
    
    private func viewFromNibForClass() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let stringNib = String(describing: type(of: self))
        let nib = UINib(nibName: stringNib, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        
        return view
    }
    
    private func commomSetup() {
        let view = self.viewFromNibForClass()
        view.frame = self.bounds
        
        addSubview(view)
    }
    
    //MARK: - Functions
    func moveImageToInitialPosition() {
        
        self.centerImageViewCenterYConstraint.constant = (self.frame.size.height/2) + (self.centerImageViewWidthConstraint.constant/2) //aspect ratio 1:1 so I can use the width

    }
    
    func animateImage() {
        
        self.centerImageViewCenterYConstraint.constant = 0
        
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 5.0, options: .curveLinear, animations: {
            
            self.layoutIfNeeded()
            self.updateConstraints()
            
        }, completion: nil)
    }

}
