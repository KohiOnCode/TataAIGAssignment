//
//  UIViewController + Haptic.swift
//  Tata_AIG_Assignment
//
//  Created by Kohinoor on 11/06/24.
//

import Foundation
import UIKit

extension UIViewController{
    
    // MARK: HAPTIC_EFFECT_METHOD
    
    func addHapticFeedback(){
        let feedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
        feedbackGenerator.impactOccurred()
    }
}



