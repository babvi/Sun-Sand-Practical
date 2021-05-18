//
//  BaseModel.swift
//  Sun & Sand
//
//  Created by Nimit Bagadiya on 18/05/21.
//

import Foundation

struct BaseModel<T: Codable>: Codable {
    
    let info: Info?
    let results: T?
    
}

// MARK: - Info
struct Info: Codable {
    let seed: String?
    let results, page: Int?
    let version: String?
}
