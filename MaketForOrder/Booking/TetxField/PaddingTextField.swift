//
//  PaddingTextField.swift
//  MaketForOrder
//
//  Created by Ratibor on 28.12.2023.
//

import UIKit

class PaddingTextField: UITextField {
    private let verticalPadding: CGFloat = 10.0
    private let horizontalPadding: CGFloat = 16
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return super.textRect(forBounds: bounds).inset(by: UIEdgeInsets(top: verticalPadding, left: horizontalPadding, bottom: verticalPadding, right: horizontalPadding))
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return super.editingRect(forBounds: bounds).inset(by: UIEdgeInsets(top: verticalPadding, left: horizontalPadding, bottom: verticalPadding, right: horizontalPadding))
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        let verticalInset = bounds.size.height / 2 - font!.lineHeight / 2
        return bounds.inset(by: UIEdgeInsets(top: verticalInset, left: horizontalPadding, bottom: verticalInset, right: horizontalPadding))
    }
}

