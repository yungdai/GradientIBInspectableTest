//
//  GradientInspectable.swift
//  GradientIBInspectableTest
//
//  Created by Yung Dai on 2015-08-27.
//  Copyright © 2015 Yung Dai. All rights reserved.
//

import UIKit

@IBDesignable class GradientInspectable: UIView {
    
    // test

    
    @IBInspectable var gradientStartColor: UIColor = UIColor.whiteColor()
    @IBInspectable var gradientEndColor: UIColor = UIColor.blackColor()
    @IBInspectable var roundness: CGFloat = 0.0
    @IBInspectable var endPoint: CGPoint = CGPoint(x: 1, y: 0)
    @IBInspectable var startPoint: CGPoint = CGPoint(x: 1, y: 0)
    
    // Helper to return the main layer as CAGradientLayer
    @IBInspectable var gradientLayer: CAGradientLayer {
        return layer as! CAGradientLayer
    }
    

    // MARK: Internal functions *********************************
    
    // Setup the view appearance
    private func setupView(){
        let colors:Array = [gradientStartColor.CGColor, gradientEndColor.CGColor]
        gradientLayer.colors = colors
        gradientLayer.cornerRadius = roundness
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        self.setNeedsDisplay()
        
    }
    

    
    // MARK: Overrides ******************************************
    
    override class func layerClass()->AnyClass{
        return CAGradientLayer.self
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    override func prepareForInterfaceBuilder() {
        layer.masksToBounds = true
        setupView()
    }
    override func awakeFromNib() {
        layer.masksToBounds = true
        setupView()
        
    }
    
}
