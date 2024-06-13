//
//  DetailVC.swift
//  Tata_AIG_Assignment
//
//  Created by Kohinoor on 11/06/24.
//

import UIKit

class DetailVC: UIViewController {
    
    // MARK: OUTLETS
    
    @IBOutlet weak var detailImgVw: UIImageView!
    @IBOutlet weak var detailLbl: UILabel!
    
    // MARK: VARIABLES
    
    var list : ListModel?
    
    
    // MARK: VIEW_DID_LOAD
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Detail Screen"
        setupUI()
    }
    
    // MARK: SETUP_UI_METHOD
    
    func setupUI(){
        detailLbl.text = list?.listTitle
        detailImgVw.sd_setImage(with: URL(string: list?.listImage ?? ""), placeholderImage: UIImage(named: "placeholder"))
    }
    

}
