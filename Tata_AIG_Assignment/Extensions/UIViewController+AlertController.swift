//
//  UIViewController+AlertController.swift
//  Tata_AIG_Assignment
//
//  Created by Kohinoor on 11/06/24.
//

import Foundation
import UIKit

extension UIViewController{
    
    // MARK: UIVIEWCONTROLLER_EXTENSION_TO_SHOW_UIALERTCONTROLLER_ALERT_WITH_MESSAGE
    
    func ShowAlert(mesaage:String){
        let alertController = UIAlertController(title: "Alert", message: mesaage, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)
        self.present(alertController, animated: true)
    }
}
