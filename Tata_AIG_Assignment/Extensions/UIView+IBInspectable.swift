//
//  UIView+IBInspectable.swift
//  Tata_AIG_Assignment
//
//  Created by Kohinoor on 11/06/24.
//

import Foundation
import UIKit

extension UIView{
    
    @IBInspectable var cornerRadius : CGFloat{
        get {
            return layer.cornerRadius
        }
        set{
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable var borderwidth : CGFloat{
        get {
            return layer.borderWidth
        }
        set{
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColorr : UIColor{
        get {
            return UIColor(cgColor: layer.borderColor ?? UIColor.black.cgColor)
        }
        set{
                layer.borderColor = newValue.cgColor
        }
    }
    
}
