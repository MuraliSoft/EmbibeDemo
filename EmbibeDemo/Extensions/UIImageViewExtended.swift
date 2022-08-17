//
//  UIImageViewExtended.swift
//  EmbibeDemo
//
//  Created by Admin on 8/17/22.
//

import UIKit

@IBDesignable
public class UIImageViewExtended: UIImageView {

    @IBInspectable
    var cornerRadius: CGFloat = 0 {
        didSet { resolveCornerRadius() }
    }

    @IBInspectable
    var borderWidth: CGFloat = 0 {
        didSet { layer.borderWidth = borderWidth }
    }

    @IBInspectable
    var borderColor: UIColor = .white {
        didSet { layer.borderColor = borderColor.cgColor }
    }

    @IBInspectable
    var rounded: Bool = false {
        didSet { resolveCornerRadius() }
    }

    var layoutSubviewsClosure: ((UIImageViewExtended) -> Void)?

    override public func layoutSubviews() {
        super.layoutSubviews()
        resolveCornerRadius()
        layoutSubviewsClosure?(self)
    }

    func resolveCornerRadius() {
        if self.rounded {
            self.addMaskToBounds(maskBounds: self.frame)
            layer.cornerRadius = bounds.size.height / 2
        } else {
            layer.cornerRadius = cornerRadius
        }
    }

    private func addMaskToBounds(maskBounds: CGRect) {
        let maskLayer = CAShapeLayer()
        let maskPath = CGPath(ellipseIn: maskBounds, transform: nil)
        maskLayer.bounds = maskBounds
        maskLayer.path = maskPath
        maskLayer.fillColor = UIColor.black.cgColor
        let point = CGPoint(x: maskBounds.size.width / 2, y: maskBounds.size.height / 2)
        maskLayer.position = point
        self.layer.mask = maskLayer
    }
}
