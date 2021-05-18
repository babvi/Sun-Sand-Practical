//
//  AppUrls.swift
//  Sun & Sand
//
//  Created by Nimit Bagadiya on 18/05/21.
//

import Foundation

struct AppUrls {
    
    private struct Domains {
        static let dev = "https://randomuser.me"
        static let prod = ""
    }
 
    private struct AppVersions {
        static let v1 = ""
    }
    
    private struct Routes {
        static let api = "/api/"
    }
    
    private static let Domain = Domains.dev
    private static let route = Routes.api
    private static let BaseURL = Domain + route
    
    static var v1BaseURL: String {
        return BaseURL + AppVersions.v1
    }
    
    static func getUsers(page: Int, numberOfRecord: Int) -> String {
        return "?page=\(page)&results=\(numberOfRecord)"
    }
}
