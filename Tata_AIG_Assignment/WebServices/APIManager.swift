//
//  APIManager.swift
//  Tata_AIG_Assignment
//
//  Created by Kohinoor on 11/06/24.
//

import Foundation
import UIKit
import Alamofire
import PKHUD

class APIManager {
    
    // MARK: - Shared Instance
    static let shared = APIManager()
    
    private init(){
        
    }
    
    
    // MARK: - Base Request API
    func baseRequestApi<T: Codable>(_ url: URLConvertible, _ method : HTTPMethod, _ params: [String: Any]? = nil, _ headers: [String: String]? = nil,_ isForPostListing:Int? = -1, completion: @escaping (_ response : T?) -> Void) {
        //print(method)
        print("url------------------>>",url)
        //print(params as Any)
        print(headers as Any)
        if Reachability().isConnectedToNetwork() {
            AF.request(url, method: method, parameters: params, encoding: JSONEncoding.default, headers: headers?.toHeader()) { $0.timeoutInterval = 120 }.validate().responseDecodable(of: T.self) { response in
                
                // print(response)
                
                if response.data != nil {
                    if response.response?.statusCode == 200 {
                        if let jsonData = response.data {
                            if self.isValidJson(check: jsonData) {
                                do {
                                    let dataModel = try JSONDecoder().decode(T.self, from: jsonData)
                                    completion(dataModel)
                                } catch {
                                    print(error.localizedDescription)
                                }
                            } else {
                                HUD.flash(.labeledError(title: EMPTY_STR, subtitle: AppErrors.somethingWrong.localizedDescription), delay: 1.0)
                            }
                        }
                    } else if response.response?.statusCode == 400 {
                        do {
                            if let jsonData = response.data {
                                if self.isValidJson(check: jsonData) {
                                    let dataModel = try JSONDecoder().decode(T.self, from: jsonData)
                                    completion(dataModel)
                                } else {
                                    HUD.flash(.labeledError(title: EMPTY_STR, subtitle: AppErrors.somethingWrong.localizedDescription), delay: 1.0)
                                }
                            }
                        } catch {
                            print(error.localizedDescription)
                        }
                    } else if response.response?.statusCode == 401 {
                        
                        if let delegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
                            
                        }
                    } else if response.response?.statusCode == 500 {
                        do {
                            if let jsonData = response.data {
                                //print(jsonData)
                                if self.isValidJson(check: jsonData) {
                                    let dataModel = try JSONDecoder().decode(T.self, from: jsonData)
                                    completion(dataModel)
                                } else {
                                    HUD.flash(.labeledError(title: EMPTY_STR, subtitle: AppErrors.somethingWrong.localizedDescription), delay: 1.0)
                                }
                            }
                        } catch {
                            print(error.localizedDescription)
                        }
                    } else {
                        do {
                            if let jsonData = response.data {
                                if self.isValidJson(check: jsonData) {
                                    let dataModel = try JSONDecoder().decode(T.self, from: jsonData)
                                    completion(dataModel)
                                    self.handleErrorCase(response.response?.statusCode, dataModel as? NSDictionary)
                                } else {
                                    HUD.flash(.labeledError(title: EMPTY_STR, subtitle: AppErrors.somethingWrong.localizedDescription), delay: 1.0)
                                }
                            }
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                } else {
                    HUD.flash(.labeledError(title: EMPTY_STR, subtitle: AppErrors.somethingWrong.localizedDescription), delay: 1.0)
                }
            }
        } else {
            HUD.flash(.labeledError(title: EMPTY_STR, subtitle: AppErrors.noInternetConnection.localizedDescription), delay: 1.0)
        }
    }
    
    // MARK: TO_CHECK_WHETHER_THE_JSON_IS_VALID_OR_NOT
    
    private func isValidJson(check data: Data) -> Bool {
        do {
            if let _ = try JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary {
                return true
            } else if let _ = try JSONSerialization.jsonObject(with: data, options: []) as? NSArray {
                return true
            } else {
                return false
            }
        } catch let error as NSError {
            print(error)
            return false
        }
    }
    
    // MARK: - FUNCTIONS_TO_HANDLE_ERRORS
    private func handleErrorCase(_ statusCode : Int?, _ dict : NSDictionary?) {
        let msg = dict?.value(forKey: "message") as? String
        //print("msg->", msg as Any)
        //print("statusCode->",statusCode!)
        HUD.hide()
        
        if msg != nil {
            //if msg == AppErrors.sessionExpire.localizedDescription {
            //HUD.flash(.labeledError(title: EMPTY_STR, subtitle: msg), onView: UIApplication.visibleViewController.view, delay: 1.5) { _ in
            //self.goToLogin()
            //}
            //} else {
            //HUD.show(.labeledError(title: EMPTY_STR, subtitle: msg))
            //}
        }
    }
}


// MARK: - Dictionary Extension
extension Dictionary where Key == String, Value == String {
    func toHeader() -> HTTPHeaders {
        var headers: HTTPHeaders = [:]
        for (key, value) in self {
            headers.add(name: key, value: value)
        }
        return headers
    }
}
