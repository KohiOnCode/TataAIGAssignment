//
//  HomeVC+Extension.swift
//  Tata_AIG_Assignment
//
//  Created by Kohinoor on 11/06/24.
//

import Foundation
import UIKit
import SDWebImage
import PKHUD

//  MARK: HOMEVC_EXTENSION_UITABLEVIEW

extension HomeVC : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listTblVw.dequeueReusableCell(withIdentifier: "ListTblViewCell", for: indexPath) as! ListTblViewCell
        
        cell.listLbl.text = listArray[indexPath.row].listTitle
        cell.listImgVw.sd_setImage(with: URL(string: listArray[indexPath.row].listImage ?? ""), placeholderImage: UIImage(named: "placeholder"))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return listCellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.addHapticFeedback()
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        nextVC.list = listArray[indexPath.row]
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
}


//  MARK: HOMEVC_EXTENSION_UICOLLECTIONVIEW

extension HomeVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ogListArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = bannerCollectionVw.dequeueReusableCell(withReuseIdentifier: "BannerCollectionVwCell", for: indexPath) as! BannerCollectionVwCell
        cell.bannerImgVw.sd_setImage(with: URL(string: ogListArray[indexPath.row].listImage ?? ""), placeholderImage: UIImage(named: "placeholder"))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: bannerCollectionVw.layer.frame.width, height: bannerCollectionVw.layer.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
    
}


//  MARK: HOMEVC_EXTENSION_UITEXTFIELD

extension HomeVC : UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        let updatedText = (currentText as NSString).replacingCharacters(in: range, with: string)
        if updatedText.isEmpty{
            DispatchQueue.main.asyncAfter(deadline: .now()+1.1) { [weak self] in
                self?.listArray = self?.ogListArray ?? []
            }
        }
        else{
            homeViewModel?.filterData(searchText: updatedText){ arr in
                self.listArray = arr
            }
        }
        return true
    }
    
    
    
}
