//
//  TYToast.swift
//  TYToast
//
//  Created by Yash Thaker on 26/10/17.
//  Copyright © 2017 YashThaker. All rights reserved.
//

import UIKit

public enum Position {
    
    case center
    case bottom
}

extension UIView {
    
    public func makeToast(message: String, position: Position) {
        
        self.hideToast()
        
        let errorlabel = ErrorLabel()
        errorlabel.text = message
        self.addSubview(errorlabel)
        
        let messageWidth = message.size(withAttributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.regular)]).width
    
        if messageWidth > self.frame.size.width {
            
            errorlabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
            errorlabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16).isActive = true
            errorlabel.numberOfLines = 0
        }
        
        errorlabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        if position == .center {
            errorlabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        } else if position == .bottom {
            errorlabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -70).isActive = true
        }
    }
    
  public func hideToast() {
        for subview in self.subviews {
            if (subview is ErrorLabel) {
                subview.removeFromSuperview()
            }
        }
    }
}

public class ErrorLabel: UILabel {
    
    override init(frame:CGRect) {
        super.init(frame:frame)
        self.setup()
        self.shake()
    }
    
    public func setup() {
        self.textColor = .white
        self.textAlignment = .center
        self.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.regular)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.init(white: 0.1, alpha: 0.7)
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
        self.numberOfLines = 0
    }

    let topInset = CGFloat(7)
    let bottomInset = CGFloat(7)
    let leftInset = CGFloat(10)
    let rightInset = CGFloat(10)
    
    override public func drawText(in rect: CGRect) {
        let insets: UIEdgeInsets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: UIEdgeInsetsInsetRect(rect, insets))
    }
    
    override public var intrinsicContentSize: CGSize {
        var intrinsicSuperViewContentSize = super.intrinsicContentSize
        intrinsicSuperViewContentSize.height += topInset + bottomInset
        intrinsicSuperViewContentSize.width += leftInset + rightInset
        return intrinsicSuperViewContentSize
    }
    
    public func shake() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.duration = 0.6
        animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
        layer.add(animation, forKey: "shake")
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
}
