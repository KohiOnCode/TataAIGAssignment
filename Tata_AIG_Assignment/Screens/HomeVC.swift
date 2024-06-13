//
//  ViewController.swift
//  Tata_AIG_Assignment
//
//  Created by Kohinoor on 11/06/24.
//

import UIKit

class HomeVC: UIViewController, FetchHomeScreenData {
        
    // MARK: OUTLETS
    
    @IBOutlet weak var bannerCollectionVw: UICollectionView!
    @IBOutlet weak var listTblVw: UITableView!
    @IBOutlet weak var searchTxtFld: UITextField!
    @IBOutlet weak var ListTblVwHeight: NSLayoutConstraint!
    @IBOutlet weak var noDataLbl: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    
        
    // MARK: VARIABLES
    
    var homeViewModel : HomeViewModel?
    var listCellHeight : CGFloat = 140
    var ogListArray : [ListModel] = []{
        didSet{
            listArray = ogListArray
            pageControl.numberOfPages = ogListArray.count
            bannerCollectionVw.reloadData()
        }
    }
    
    var listArray : [ListModel] = [] {
        didSet{
            if listArray.count > 0{
                noDataLbl.isHidden = true
            }
            else{
                noDataLbl.isHidden = false
            }
            ListTblVwHeight.constant = CGFloat(listArray.count) * listCellHeight
            listTblVw.reloadData()
        }
    }
    
    
    
    //  MARK: VIEW_DID_LOAD

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Home Screen"
        
        homeViewModel = HomeViewModel()
        homeViewModel?.delegate = self
        
        listTblVw.delegate = self
        listTblVw.dataSource = self
        
        bannerCollectionVw.delegate = self
        bannerCollectionVw.dataSource = self
        
        searchTxtFld.delegate = self
        
        ListTblViewCell.registerTableCell(for: listTblVw)
        BannerCollectionVwCell.registerCollectionViewCell(for: bannerCollectionVw)
        
        homeViewModel?.fetchHomeScreenData()
        
        pageControl.addTarget(self, action: #selector(self.pageControlSelectionAction(_:)), for: .valueChanged)
    }

    
    //  MARK: VIEW_WILL_APPEAR
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        GetDataCall()
    }
    
    
   
    //  MARK: GET_HOME_SCREEN_DATA_METHOD
    
    func GetDataCall(){
        ogListArray = homeViewModel?.getListsData() ?? []
    }

    
    // MARK: VIEWMODEL_DELEGATE_TO_BIND_MOVIES_DATA
    
    func DataFetchedCall(fetched: Bool) {
        if fetched{
           GetDataCall()
        }
    } 
    
    
    //  MARK: BANNER_SCROLL_METHOD
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
          let offSet = scrollView.contentOffset.x
          let width = scrollView.frame.width
        let maxiMumScroll = CGFloat(ogListArray.count - 1) * width + 20
        if offSet > maxiMumScroll{
            pageControl.currentPage = 0
            let indxPath = IndexPath(item: 0, section: 0)
            bannerCollectionVw.scrollToItem(at: indxPath, at: .right, animated: false)
        }
        else if offSet < -10{
            pageControl.currentPage = ogListArray.count - 1
            let indxPath = IndexPath(item: ogListArray.count - 1, section: 0)
            bannerCollectionVw.scrollToItem(at: indxPath, at: .left, animated: false)
        }
        else{
            let index = Int(round(offSet/width))
            pageControl.currentPage = index // This will animate the page controll transition,
        }
        print(offSet)
        print(width)
        print(index)
      }
    
    
    // MARK: PAGE_CONTROL_ACTION_ADDTARGET
    
    @objc func pageControlSelectionAction(_ sender: UIPageControl) {
        let page: Int = sender.currentPage
        self.addHapticFeedback()
        let indxPath = IndexPath(item: page, section: 0)
        bannerCollectionVw.scrollToItem(at: indxPath, at: .right, animated: false)
       }
    

}

