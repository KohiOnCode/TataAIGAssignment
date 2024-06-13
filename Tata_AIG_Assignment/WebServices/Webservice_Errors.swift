//
//  Webservice_Errors.swift
//  Tata_AIG_Assignment
//
//  Created by Kohinoor on 11/06/24.
//

import Foundation


// MARK: - ERRORS
public enum AppErrors: String {
    case emptyMessage
    case noInternetConnection
    case requiredInternetConnection
    case somethingWrong
    case invalidURL
}

extension AppErrors {
    public var localizedDescription: String {
        switch self {
        case .emptyMessage: return "Enter A Message"
        case .noInternetConnection: return "Not Connected To Internet"
        case .requiredInternetConnection: return "Need Internet ForAction"
        case .somethingWrong : return "Something Went Wrong"
        case .invalidURL : return "Invalid URL"
        }
    }
}
