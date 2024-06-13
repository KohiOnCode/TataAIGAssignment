# TataAIGAssignment
Tata AIG Assignment

## Introduction

This project is a two screen projects, “Home Screen” and “Detail Screen”. This project contains following :-

	1.	Architectural Pattern - MVVM (Model View ViewModel).
	2.	Design Patterns - Delegate Pattern, Singleton Pattern, Factory Pattern, Repository Pattern.
	3.	Extensions
	4.	Webservices
	5.	Local Database for Offline storage
	6.	Unit Testing
	7.	Xib’s for Cells
	8.	Property Observers
	9.	CocoaPods - IQKeyboardManagerSwift, Alamofire, SDWebImage, PKHUD
	10.	GCD, Debouncing, Memory Management 
  11. SOLID Principles

————————————————————————————————————————————————————

Home Screen - 
## MODEL :- 
 Movies Model - This stores the Webservice data.
 ListModel - This stores the actual data which need to handle app operations.
 
 ## VIEW :- 
 VIEW consist of ViewController, ViewController Extension, TableViewCell, CollectionView Cell and Xib’s. 
 
 HomeVC : Controller shouldn’t contain business logic. All the UIKIT referenced tasks handled in HomeVC.  
 
 HomeVC+Extension :- This file is an extension of HomeVC which contains UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout and UITextfieldDelegate.  
 
 ListTblViewCell - This is a UITableViewCell, used for listing of images and labels together.  
 
 BannerCollectionVwCell - This is a UICollectionViewCell, used for Images carousel functionality.

## VIEWMODEL :-
 HomeViewModel - This is a ViewModel for HomeVC which manages all the business logics and Data calls for HomeVC Controller. It contains. API data call method, Core Data operations method and few FilterData related task logics.


Detail Screen -  Controller :-  DetailVC - This controller handles UI via SETUP Method on the basis of List model type data which passed by HomeVC via did select row at delegate of uitableview. 

———————————————————————————————————————————————————— 

##   Extensions :-   

Extension_UITableviewCell - This is an UITableViewCell Extension created that includes a method which is used to register UITableViewCell with UITableView.

Extension_UICollectionviewCell - This is an UICollectionviewCell Extension which include that includes a method which is used to register UICollectionviewCell with UICollectionview.

UIView+IBInspectable - This is an UIVIEW Extension which include IBINSPECTABLE  properties like Corner Radius, BorderWidth and BorderColor properties.  

UIViewController + Haptic - This is an UIVIEWCONTROLLER Extension which include Haptic Generator for action in UIViewController.  

UIViewController+AlertController - This is an UIVIEWCONTROLLER Extension which include method SHOWALERT with Message to present UIALERTCONTROLLER on viewController.

———————————————————————————————————————————————————— 

## API_Manager

Webservices Class :-  API_List - This file contains an ENUM which contains list of API.  Webservice_Errors - This file contains an ENUM of user defined APP ERROS.

Reachability - This file consist of Method isConnectedToNetwork which is used to verify Internet is connected or not.  APIManager - This file contains methods which used to fetch API calls.

————————————————————————————————————————————————————  

## CoreData- Offline Storage 

CDList+CoreDataClass - NSManagedObject Class Generated Xcode for entity CDList.
CDList+CoreDataProperties - NSManagedObject Class Generated Xcode for entity CDList.  

PersistantStorage - Class to manage NSManagedObjectContext.  

ListRepository - CoreData Operations Repository files. 
ListManager - This file is used to manage Repository pattern.

———————————————————————————————————————————————————— 

## UNIT_TEST_FILES  

HomeViewModelTests - Unit test class for HomeViewModel.
DetailVCTests - Unit test class for DetailVC and UIAlertController Extension.
IBinspectableTests - Unit test class for IBInspectable UIVIEW extension.
APIErrorTests - Unit test class for APIErrors Enum. 
HapticFeedbackTests - Unit test class for Extension Haptic Generator. 
HomeVCTextFieldDelegateTests - Unit test class for TextField Delegates in HomeVC.
