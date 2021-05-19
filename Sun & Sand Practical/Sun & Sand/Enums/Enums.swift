//
//  Enums.swift
//  Sun & Sand
//
//  Created by Nimit Bagadiya on 18/05/21.
//

import Foundation

enum CustomError: Error {
    case noInternetFound
    case dataParsingError
    case other(String)
    
    var errorDescription: String {
        
        switch self {
        case .noInternetFound:
            return "No internet connection found. please try again later"
        case .dataParsingError:
            return "Something went wrong. please try again later"
        case .other(let description):
            return description
        }
        
    }
}
