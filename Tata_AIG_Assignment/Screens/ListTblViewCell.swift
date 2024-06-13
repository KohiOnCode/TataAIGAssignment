//
//  ListTblViewCell.swift
//  Tata_AIG_Assignment
//
//  Created by Kohinoor on 11/06/24.
//

import UIKit

class ListTblViewCell: UITableViewCell {
    
    // MARK: OUTLETS
    
    @IBOutlet weak var listImgVw: UIImageView!
    @IBOutlet weak var listLbl: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
